class CreateBeneficiaries < ActiveRecord::Migration
  def change
    create_table :beneficiaries do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :position
      t.string :phone
      t.string :cedula

      t.timestamps null: false
    end
  end
end
