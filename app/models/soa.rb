require 'text_file'
class Soa < ApplicationRecord
  #Relations
  belongs_to :domain, optional: true

  #Callbacks
  after_create :create_text_file
  after_update :create_text_file

  #Validations
  validates :nameserver1, :nameserver2, :email, presence: true

  private

  def create_text_file
    #WriteDomainJob.perform_later(self.domain_id,self.domain.name)
    #process = FileProcess.new
    #process.create_file_for_domain(self.domain.name,self.domain.id)
  end
end