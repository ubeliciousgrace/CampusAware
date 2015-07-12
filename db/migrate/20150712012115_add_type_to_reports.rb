class AddTypeToReports < ActiveRecord::Migration
  def change
    add_column :reports, :type, :string, array: true
    add_column :reports, :bystander_or_victim, :string
  end
end
