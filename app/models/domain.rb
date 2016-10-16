require 'text_file'
class Domain < ApplicationRecord
  has_many :records, dependent: :destroy
  validates :name, presence: true
  after_create :create_text_file
  after_destroy :destroy_text_file

  def self.search(q)
    q = "%#{q.downcase}%"
    where("lower(name) LIKE ?", q)
  end

  def create_text_file
    process = FileProcess.new
    process.create_file_for_domain(self.name, self.id)
  end

  def destroy_text_file
    process = FileProcess.new
    process.delete_file(self.name)
  end
end
