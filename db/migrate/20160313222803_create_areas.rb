class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.string :code
      t.string :name
      t.boolean :reservable, default: true, null: false
      t.integer :status, default: 0, null: false
      t.belongs_to :area, index: true, foreign_key: true
      t.belongs_to :institute, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
