class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :user, index: true
      t.references :market, index: true
      t.integer :rating, default: 0
      t.text :content

      t.timestamps
    end
    add_foreign_key :reviews, :users
    add_foreign_key :reviews, :markets
  end
end
