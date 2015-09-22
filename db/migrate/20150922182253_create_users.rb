class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :name
      t.string :email
      t.string :location
      t.string :provider
      t.string :token
      t.string :uid
      t.string :image
      t.string :description
      t.string :urls

      t.timestamps null: false
    end
  end
end
