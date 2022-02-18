class Contributor < ActiveRecord::Base
  has_many :accounts
  has_many :pledges

  validates :first_name, presence: true, length:{ minimum: 3 }
  validates :last_name, presence: true, length:{ minimum: 3 }
  validates :email, presence: true, uniqueness: true, format: {with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address" }
end