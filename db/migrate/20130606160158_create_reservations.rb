class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.date :start_date
      t.date :end_date
      t.references :room
      t.references :customer

      t.timestamps
    end
    add_index :reservations, :room_id
    add_index :reservations, :customer_id
  end
end
