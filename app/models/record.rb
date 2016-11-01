require 'text_file'
class Record < ApplicationRecord
  belongs_to :domain
  validates :name, :rtype, :content, :ttl, presence: true
  after_create :create_text_file
  after_update :create_text_file
  after_destroy :create_text_file

  enum rtype: { A: 0, SOA: 1, AAAA: 2, NS: 3, PTR: 4, CNAME: 5, MX: 6, SRV: 7, TXT: 8, NAPTR: 9}

  private

  def create_text_file
    process = FileProcess.new
    process.create_file_for_record(self.domain_id)
  end
end
