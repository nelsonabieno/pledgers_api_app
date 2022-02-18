class Account < ActiveRecord::Base
  validates :bank_name, presence: true
  validates :account_number, presence: true

  belongs_to :contributor
  has_many :transactions

end