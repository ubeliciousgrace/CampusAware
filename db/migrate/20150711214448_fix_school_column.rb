class FixSchoolColumn < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.remove :school_id
      t.column :school_name, :string
    end
  end
end
