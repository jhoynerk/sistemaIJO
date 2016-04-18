class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :code
      t.string :name
      t.string :description
      t.integer :status, default: 0, null: false
      t.boolean :movil, default: false, null: false
      t.boolean :pedagogic, default: false, null: false
      t.belongs_to :type_resource, index: true, foreign_key: true
      t.belongs_to :resource, index: true, foreign_key: true
      t.belongs_to :area, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
