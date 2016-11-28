require 'text_file'
class Record < ApplicationRecord
  belongs_to :domain
  validates :name, :rtype, :content, :ttl, presence: true
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
      validates_format_of :content, :multiline => true, :with=> /^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$/
    end
  end

  def serial
    self.domain.soa.update_attribute(:serial_number, Time.now.to_i)
  end
end
