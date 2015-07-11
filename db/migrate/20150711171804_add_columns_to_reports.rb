class AddColumnsToReports < ActiveRecord::Migration
  

  def change
    add_column :reports, :description, :text
    add_column :reports, :street_number, :integer
    add_column :reports, :street_name, :string
    add_column :reports, :city, :string
    add_column :reports, :state, :string
    add_column :reports, :zip_code, :integer
    add_column :reports, :user_id, :integer
    add_column :reports, :lat, :float
    add_column :reports, :long, :float
    add_column :reports, :created_at, :datetime
    add_column :reports, :updated_at, :datetime 
  end
  
end


