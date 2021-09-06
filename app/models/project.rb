class Project < ActiveRecord::Base
  has_many :transactions
  has_many :pledges
end