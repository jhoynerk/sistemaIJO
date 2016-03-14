class CreateInstitutes < ActiveRecord::Migration
  def change
    create_table :institutes do |t|
      t.integer :code
      t.string :name

      t.timestamps null: false
    end
  end
end
