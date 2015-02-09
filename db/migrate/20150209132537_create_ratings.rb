class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.references :market, index: true
      t.references :user, index: true
      t.integer :score, default: 0

      t.timestamps null: false
    end
    add_foreign_key :ratings, :users
    add_foreign_key :ratings, :markets
  end
end
