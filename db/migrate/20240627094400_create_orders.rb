class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :watch, null: false, foreign_key: true
      t.decimal :total_price
      t.string :status

      t.timestamps
    end
  end
end
