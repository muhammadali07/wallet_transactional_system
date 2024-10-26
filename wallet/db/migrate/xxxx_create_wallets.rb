# db/migrate/xxxx_create_wallets.rb
class CreateWallets < ActiveRecord::Migration[6.1]
  def change
    create_table :wallets do |t|
      t.references :owner, polymorphic: true, index: true
      t.decimal :balance, precision: 15, scale: 2, default: 0

      t.timestamps
    end
  end
end
