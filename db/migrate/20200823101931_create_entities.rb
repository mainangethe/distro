class CreateEntities < ActiveRecord::Migration[6.0]
  def change
    create_table :entities, id: :uuid do |t|
      t.string :name, null: false
      t.integer :entity_type, null: false
      t.string :email
      t.string :logo
      t.integer :status, null: false, default: 0
      t.references :user, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
