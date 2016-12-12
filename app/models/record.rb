require 'text_file'
class Record < ApplicationRecord
  belongs_to :domain
  validates :rtype, :content, :ttl, presence: true

  REGEX_DOMAIN_NAME = /(?=^.{4,253}$)(^((?!-)[a-zA-Z0-9-]{1,63}(?<!-)\.)+[a-zA-Z]{2,63}\.?$)/
  validates :name, presence: true, format: { with: REGEX_DOMAIN_NAME }

  validate :check_content
  after_create :create_text_file, :serial
  after_update :create_text_file
  after_destroy :create_text_file, :serial

  enum rtype: { A: 0, AAAA: 1, NS: 2, PTR: 3, CNAME: 4, MX: 5, SRV: 6, TXT: 7, NAPTR: 8}


  private
  def create_text_file
    process = FileProcess.new
    process.create_file_for_record(self.domain_id)
  end

  def check_content
    if rtype == "A" || rtype == "AAAA"
      validates_format_of :content, multiline: true, :with => Regexp.union(Resolv::IPv4::Regex, Resolv::IPv6::Regex)
    end
  end

  def serial
    self.domain.soa.update_attribute(:serial_number, Time.now.to_i)
  end
end
