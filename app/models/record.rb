class Record < ApplicationRecord
  belongs_to :domain

  validates :name, :type, :content, :ttl, presence: true

end
