class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :title
      t.text :description
      t.integer :street_number
      t.string :street_name
      t.string :city
      t.string :state 
      t.integer :zip_code
      t.integer :user_id
      t.float :lat
      t.float :long
      t.timestamps null: false
    end
  end
end
