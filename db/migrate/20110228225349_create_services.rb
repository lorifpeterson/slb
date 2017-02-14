class CreateServices < ActiveRecord::Migration
  def self.up
    create_table :services do |t|
      t.integer :id
      t.integer :user_id
      t.integer :city_id
      t.string :name
      t.string :type
      t.string :profile_image
      t.string :address_1
      t.string :address_2
      t.string :email
      t.string :phone
      t.datetime :created_dt
      t.datetime :updated_dt
      t.text :directions
      t.text :equipment
      t.boolean :paid
      t.datetime :expire_dt
      t.string :hours
      t.string :specials
      
      t.timestamps
    end
  end

  def self.down
    drop_table :services
  end
end
