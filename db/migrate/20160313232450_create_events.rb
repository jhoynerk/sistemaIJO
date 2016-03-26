class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :code
      t.string :description
      t.string :observations
      t.datetime :date_start
      t.datetime :date_end
      t.belongs_to :beneficiary, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
