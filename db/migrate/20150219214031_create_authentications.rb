class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.references :user, null: false, index: true
      t.string :provider, null: false
      t.string :uid, null: false

      t.timestamps
    end
    add_foreign_key :authentications, :users
    add_index :authentications, [:user_id, :provider], unique: true
  end
end
