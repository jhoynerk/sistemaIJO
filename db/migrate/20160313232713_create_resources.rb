class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.integer :code
      t.string :name
      t.string :description
      t.integer :capacity
      t.belongs_to :resource, index: true, foreign_key: true
      t.belongs_to :area, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
