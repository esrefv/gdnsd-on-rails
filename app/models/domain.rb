require 'text_file'
class Domain < ApplicationRecord
  #Relations
  has_many :records, dependent: :destroy
  has_one :soa, dependent: :destroy
  accepts_nested_attributes_for :soa

  #Validations
  validates :name, presence: true, uniqueness: true

  #Callbacks
  before_update :serial
  before_create :serial
  after_update  :delete_before_file
  after_destroy :destroy_text_file
  after_commit :create_text_file, on: [:create,:update]

  def self.search(q)
    q = "%#{q.downcase}%"
    where("lower(name) LIKE ?", q)
  end

  private
  def serial
    unless self.soa.nil?
      self.soa.serial_number = Time.now.to_i
    end
  end

  def create_text_file
    WriteDomainJob.perform_later(self.id,self.name)
    #WriteDomainJob.set(wait: 1.second).perform_later(self.id,self.name)
    #process = FileProcess.new
    #process.create_file_for_domain(self.name, self.id)
  end

  def destroy_text_file
    DeleteDomainJob.perform_later(self.name)
    #process = FileProcess.new
    #process.delete_file(self.name)
  end


  def delete_before_file
    if self.changes[:name]
      puts self.changes[:name]
      #process = FileProcess.new
      #process.delete_file(self.changes[:name][0])
      DeleteDomainJob.perform_later(self.changes[:name][0])
    end
  end

end
