class CreateMarkets < ActiveRecord::Migration
  def change
    create_table :markets do |t|
      t.references :user, index: true
      t.string :name
      t.text :description

      t.timestamps
    end
    add_foreign_key :markets, :users
  end
end
