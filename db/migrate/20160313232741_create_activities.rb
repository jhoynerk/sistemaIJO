class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :code
      t.string :description
      t.datetime :date_start
      t.datetime :date_end
      t.belongs_to :event, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
