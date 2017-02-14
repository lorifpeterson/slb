class User < ActiveRecord::Migration
  def self.up
     change_table :users do |t|
       t.string :password_salt
       t.string :password_hash
     end
  end

  def self.down
    change_table :users do |t|
      t.string :password_salt
      t.string :password_hash
    end
  end
end
