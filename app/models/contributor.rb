class Contributor < ActiveRecord::Base
  has_many :accounts
  has_many :pledges
end