require 'text_file'
class Domain < ApplicationRecord
  has_many :records, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  after_create :create_text_file
  after_update :create_text_file, :delete_before_file
  after_destroy :destroy_text_file
  has_one :soa, dependent: :destroy
  accepts_nested_attributes_for :soa

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
end
