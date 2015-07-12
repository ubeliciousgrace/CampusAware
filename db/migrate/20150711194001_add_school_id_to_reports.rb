class AddSchoolIdToReports < ActiveRecord::Migration
   def change
    add_column :reports, :school_id, :integer 
  end
end
