class Soa < ApplicationRecord
  belongs_to :domain, optional: true

  validates :nameserver1, :nameserver2, :email, :refresh, presence: true
end
