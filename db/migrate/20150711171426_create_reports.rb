class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :title
    end
  end
end
