class ChangeActivityDdateToBeDateInRecords < ActiveRecord::Migration[6.0]
  def change
    change_column :records, :activity_date, :date
  end
end
