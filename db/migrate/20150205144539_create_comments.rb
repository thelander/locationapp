class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, index: true
      t.references :market, index: true
      t.text :content

      t.timestamps
    end
    add_foreign_key :comments, :users
    add_foreign_key :comments, :markets
  end
end
