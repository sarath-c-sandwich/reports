class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :report_name
      t.text :report_description

      t.timestamps
    end
  end
end
