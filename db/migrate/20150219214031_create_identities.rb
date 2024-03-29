class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.string :uid
      t.string :provider
      t.references :user, index: true
    end

    add_foreign_key :identities, :users
  end
end
