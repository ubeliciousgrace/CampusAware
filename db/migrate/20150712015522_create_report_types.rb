class CreateReportTypes < ActiveRecord::Migration
  def change
    create_table :report_types do |t|
      t.string :title
      t.integer :report_id
    end
  end
end
