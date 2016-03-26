class CreateEventsResources < ActiveRecord::Migration
  def change
    create_table :events_resources, id: false do |t|
      t.belongs_to :event, index: true, foreign_key: true
      t.belongs_to :resource, index: true, foreign_key: true
    end
  end
end
