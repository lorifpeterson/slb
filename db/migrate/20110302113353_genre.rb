class Genre < ActiveRecord::Migration
  def self.up
    change_table :genres do |t|
      t.string :value
      t.boolean :show, :default => true
    end
  end

  def self.down
    change_table :genres do |t|
      :value
      :show
    end
  end
end
