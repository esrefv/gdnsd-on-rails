require 'text_file'
class Record < ApplicationRecord
  belongs_to :domain
  validates :name, :rtype, :content, :ttl, presence: true
  after_create :create_text_file
  after_update :create_text_file
  after_destroy :create_text_file

  enum rtype: { A: 0, AAAA: 1, NS: 2, PTR: 3, CNAME: 4, MX: 5, SRV: 6, TXT: 7, NAPTR: 8}

  private

  def create_text_file
    process = FileProcess.new
    process.create_file_for_record(self.domain_id)
  end
end
