class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.references :loan, foreign_key: true
      t.decimal :amount, null: false

      t.timestamps
    end
  end
end
