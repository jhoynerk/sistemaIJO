class CreateActivitiesResources < ActiveRecord::Migration
  def change
    create_table :activities_resources, id: false do |t|
      t.belongs_to :activity, index: true, foreign_key: true
      t.belongs_to :resource, index: true, foreign_key: true
    end
  end
end
