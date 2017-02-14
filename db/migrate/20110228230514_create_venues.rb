class CreateVenues < ActiveRecord::Migration
  def self.up
    create_table :venues do |t|
      t.integer :id
      t.integer :city_id
      t.string :name
      t.string :profile_image
      t.string :address_1
      t.string :address_2
      t.string :phone
      t.string :email
      t.text :info
      t.string :loc_lat_lng
      t.string :specials
      t.string :hours
      t.text :directions
      t.datetime :created_dt
      t.datetime :updated_dt
      t.integer :created_by
      t.boolean :paid
      t.datetime :expire_dt
      
      t.timestamps
    end
  end

  def self.down
    drop_table :venues
  end
end
