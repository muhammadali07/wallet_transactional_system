# app/models/wallet.rb
class Wallet < ApplicationRecord
  belongs_to :owner, polymorphic: true
  has_many :transactions_as_source, class_name: "Transaction", foreign_key: "source_wallet_id"
  has_many :transactions_as_target, class_name: "Transaction", foreign_key: "target_wallet_id"

  validates :balance, numericality: { greater_than_or_equal_to: 0 }

  # Calculate current balance based on all credit and debit transactions
  def calculate_balance
    credits = transactions_as_target.sum(:amount)
    debits = transactions_as_source.sum(:amount)
    credits - debits
  end
end
