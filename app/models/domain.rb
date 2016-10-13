class Domain < ApplicationRecord
  has_many :records, dependent: :destroy

  def self.search(q)
    q = "%#{q.downcase}%"
    where("lower(name) LIKE ?", q)
  end
end
