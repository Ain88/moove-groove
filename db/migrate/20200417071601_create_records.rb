class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      t.belongs_to :user
      t.belongs_to :activity
      t.datetime :activity_date
      t.integer :duration
      t.integer :total_calories
      t.timestamps
    end
  end
end
