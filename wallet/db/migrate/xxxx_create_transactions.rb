# db/migrate/xxxx_create_transactions.rb
class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.references :source_wallet, foreign_key: { to_table: :wallets }
      t.references :target_wallet, foreign_key: { to_table: :wallets }
      t.decimal :amount, precision: 15, scale: 2
      t.integer :transaction_type

      t.timestamps
    end
  end
end
