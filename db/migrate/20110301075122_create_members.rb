class CreateMembers < ActiveRecord::Migration
  def self.up
    create_table :members do |t|
      t.integer :id
      t.integer :band_id
      t.integer :service_id
      t.integer :venue_id
      t.string :name
      t.string :position
      t.string :joined_dt
      t.string :left_dt
      t.string :member_image

      t.timestamps
    end
  end

  def self.down
    drop_table :members
  end
end
