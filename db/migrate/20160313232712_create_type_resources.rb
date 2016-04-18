class CreateTypeResources < ActiveRecord::Migration
  def change
    create_table :type_resources do |t|
      t.string :code
      t.string :name
      t.boolean :pedagogic, default: false, null: false
      t.boolean :movil, default: false, null: false
      t.timestamps null: false
    end
  end
end
