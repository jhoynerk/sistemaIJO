class CreateTypeActivities < ActiveRecord::Migration
  def change
    create_table :type_activities do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
