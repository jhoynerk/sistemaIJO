class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :description
      t.date :date_start
      t.date :date_end
      t.belongs_to :area, index: true, foreign_key: true, null: false
      t.belongs_to :beneficiary, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
