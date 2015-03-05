class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.references :user, index: true
      t.string :name
      t.text :description

      t.timestamps
    end
    add_foreign_key :locations, :users
  end
end
