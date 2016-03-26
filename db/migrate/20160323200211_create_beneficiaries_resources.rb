class CreateBeneficiariesResources < ActiveRecord::Migration
  def change
    create_table :beneficiaries_resources, id: false do |t|
      t.belongs_to :beneficiary, index: true, foreign_key: true
      t.belongs_to :resource, index: true, foreign_key: true
    end
  end
end
