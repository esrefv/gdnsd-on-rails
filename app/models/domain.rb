require 'text_file'
class Domain < ApplicationRecord
  #Relations
  has_many :records, dependent: :destroy
  has_one :soa, dependent: :destroy
  accepts_nested_attributes_for :soa

  #Validations
  validates :name, presence: true, uniqueness: true

  #Callbacks
  after_create :create_text_file, :serial
  after_update :create_text_file, :delete_before_file, :serial
  after_destroy :destroy_text_file


  def self.search(q)
    q = "%#{q.downcase}%"
    where("lower(name) LIKE ?", q)
  end

  private

  def create_text_file
    process = FileProcess.new
    process.create_file_for_domain(self.name, self.id)
  end

  def destroy_text_file
    process = FileProcess.new
    process.delete_file(self.name)
  end


  def delete_before_file
    if self.changes[:name]
      puts self.changes[:name]
      process = FileProcess.new
      process.delete_file(self.changes[:name][0])
    end
  end

  def serial
    unless self.soa.nil?
      self.soa.serial_number = Time.now.to_i
    end
  end
end
