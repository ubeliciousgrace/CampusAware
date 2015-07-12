class FixReportTypes < ActiveRecord::Migration
  def change
    add_column :report_types, :type_id, :integer
    remove_column :report_types, :title
  end
end
