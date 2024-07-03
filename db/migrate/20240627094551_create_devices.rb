class CreateDevices < ActiveRecord::Migration[7.1]
  def change
    create_table :devices do |t|
      t.references :user, null: false, foreign_key: true
      t.string :device_name
      t.string :device_token

      t.timestamps
    end
  end
end
