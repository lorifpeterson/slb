class CreateCities < ActiveRecord::Migration
  def self.up
    create_table :cities do |t|
      t.integer :id
      t.integer :state_id
      t.string :name
      t.integer :created_by
      t.datetime :created_dt
      t.boolean :verified
      
      t.timestamps
    end
  end

  def self.down
    drop_table :cities
  end
end
