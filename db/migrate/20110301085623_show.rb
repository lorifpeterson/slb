class Show < ActiveRecord::Migration
  def self.up
    add_column :shows, :city_id, :integer
    add_column :shows, :venue_id, :integer
    add_column :shows, :band_id, :integer
    add_column :shows, :headlining, :boolean
    add_column :shows, :date, :date
    add_column :shows, :start_time, :time
    add_column :shows, :end_time, :time
    add_column :shows, :description, :text
    add_column :shows, :flyer_image, :string
    add_column :shows, :benefit, :boolean
    add_column :shows, :benefit_name, :string
    add_column :shows, :cover_charge, :float
    add_column :shows, :all_ages, :boolean
    add_column :shows, :lineup_2, :string
    add_column :shows, :lineup_3, :string
    add_column :shows, :lineup_4, :string
    add_column :shows, :lineup_5, :string
    add_column :shows, :lineup_6, :string 
  end

  def self.down
    remove_column :shows, :city_id
    remove_column :shows, :venue_id
    remove_column :shows, :band_id
    remove_column :shows, :headliner
    remove_column :shows, :date
    remove_column :shows, :start_time
    remove_column :shows, :end_time
    remove_column :shows, :description
    remove_column :shows, :flyer_image
    remove_column :shows, :benefit
    remove_column :shows, :benefit_name
    remove_column :shows, :cover_charge
    remove_column :shows, :all_ages
    remove_column :shows, :lineup_2
    remove_column :shows, :lineup_3
    remove_column :shows, :lineup_4
    remove_column :shows, :lineup_5
    remove_column :shows, :lineup_6 
  end
end
