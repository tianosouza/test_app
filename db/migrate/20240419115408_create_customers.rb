class CreateCustomers < ActiveRecord::Migration[7.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.boolean :vip
      t.integer :days_to_pay
      t.string :gender
      t.string :adrdress

      t.timestamps
    end
  end
end
