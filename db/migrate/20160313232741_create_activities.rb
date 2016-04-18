class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :description
      t.date :day
      t.time :time_start
      t.time :time_end
      t.integer :status, default: 0, null: false
      t.belongs_to :event, index: true, foreign_key: true
      t.belongs_to :beneficiary, index: true, foreign_key: true, null: false
      t.belongs_to :area, index: true, foreign_key: true, null: false
      t.belongs_to :type_activity, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
