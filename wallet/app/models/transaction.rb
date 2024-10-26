# app/models/transaction.rb
class Transaction < ApplicationRecord
  belongs_to :source_wallet, class_name: "Wallet", optional: true
  belongs_to :target_wallet, class_name: "Wallet", optional: true

  validates :amount, numericality: { greater_than: 0 }
  validate :validate_transaction_type

  enum transaction_type: { credit: 0, debit: 1 }

  private

  def validate_transaction_type
    if debit? && (source_wallet.nil? || source_wallet.balance < amount)
      errors.add(:source_wallet, "must have sufficient funds for a debit")
    elsif credit? && target_wallet.nil?
      errors.add(:target_wallet, "must exist for a credit transaction")
    end
  end
end
