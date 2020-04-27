class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.string :name
      t.integer :calories
      #calories per 15mins, minimum 15mins of exercise is required
      #also calories are based on user weight, show dif calories
      t.text :description
      t.timestamps
    end
  end
end
