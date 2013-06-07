class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :title
      t.datetime :date
      t.decimal :value
      t.references :reservation

      t.timestamps
    end
    add_index :expenses, :reservation_id
  end
end
