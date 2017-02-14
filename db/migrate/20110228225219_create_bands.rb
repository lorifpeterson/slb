class CreateBands < ActiveRecord::Migration
  def self.up
    create_table :bands do |t|
      t.integer :id
      t.integer :user_id
      t.integer :city_id
      t.integer :genre_id
      t.string :name
      t.string :email
      t.string :phone
      t.text :info
      t.integer :cover_type_cd
      t.boolean :logo
      t.boolean :shows_wanted
      t.datetime :created_dt
      t.datetime :updated_dt
      t.boolean :verified
      t.string :profile_image
      
      t.timestamps
    end
  end

  def self.down
    drop_table :bands
  end
end
