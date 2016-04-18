class CreateIncidences < ActiveRecord::Migration
  def change
    create_table :incidences do |t|
      t.string :observations
      t.belongs_to :activity, index: true, foreign_key: true, null: false
      t.belongs_to :resource, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
