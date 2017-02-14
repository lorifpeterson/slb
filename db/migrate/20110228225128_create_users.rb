class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.integer :id
      t.string :type  #[B]and, [S]ervice, [V]enue
      t.string :username
      t.text :password
      t.datetime :created_dt
      t.datetime :login_dt
      t.string :verify_url
      t.boolean :verified
      
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
