class CreateListDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :list_details, id: :uuid do |t|
      t.string :first_name, null: false
      t.string :middle_name
      t.string :last_name, null: false
      t.integer :gender, null: false
      t.integer :identification_type, null: false, default: 0
      t.string :identification_number, null: false
      t.string :phone_number, null: false
      t.string :email_address
      t.string :physical_location
      t.integer :status, null: false, default: 0
      t.references :list, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
