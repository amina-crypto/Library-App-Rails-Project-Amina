class CreateLoans < ActiveRecord::Migration[8.0]
  def change
    create_table :loans do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book, null: true, foreign_key: true
      t.references :journal, null: true, foreign_key: true
      t.datetime :due_date
      t.boolean :returned, null: false, default: false

      t.timestamps
    end
  end
end
