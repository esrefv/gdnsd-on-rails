require 'text_file'
class Soa < ApplicationRecord
  belongs_to :domain, optional: true
  after_create :create_text_file
  after_update :create_text_file
  before_create :serial
  before_update :serial
  validates :nameserver1, :nameserver2, :email, :refresh, presence: true

  def serial
    self.serial_number = Time.now.to_i
  end

  def create_text_file
      process = FileProcess.new
      process.create_file_for_domain(self.domain.name,self.domain.id)
  end
end