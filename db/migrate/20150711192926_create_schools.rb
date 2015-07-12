class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.float :lat
      t.float :long
      t.integer :street_number
      t.string :street_name
      t.string :city
      t.string :state
      t.integer :zip_code
    end
  end
end
