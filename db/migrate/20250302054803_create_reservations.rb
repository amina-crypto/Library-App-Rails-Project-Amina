class CreateReservations < ActiveRecord::Migration[8.0]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book, null: true, foreign_key: true
      t.references :journal, null: true, foreign_key: true
      t.datetime :expires_at
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
