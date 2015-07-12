class FixReports < ActiveRecord::Migration
  def change
    remove_column :reports, :type
  end
end
