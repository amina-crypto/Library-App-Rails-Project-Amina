class CreateJournals < ActiveRecord::Migration[8.0]
  def change
    create_table :journals do |t|
      t.string :title
      t.integer :volume
      t.integer :issue
      t.string :language
      t.string :publisher
      t.integer :publish_year
      t.text :description
      t.integer :category, default: 0

      t.timestamps
    end
  end
end
