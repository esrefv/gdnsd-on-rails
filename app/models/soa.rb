require 'text_file'
class Soa < ApplicationRecord
  belongs_to :domain, optional: true
  after_create :create_text_file
  after_update :create_text_file


  validates :nameserver1, :nameserver2, :email, presence: true

  private

  def create_text_file
      process = FileProcess.new
      process.create_file_for_domain(self.domain.name,self.domain.id)
  end
end