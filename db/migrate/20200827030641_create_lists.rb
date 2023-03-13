class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists, id: :uuid do |t|
      t.string :name
      t.integer :list_type, null: false
      t.integer :status, null: false, default: 0
      t.references :campaign, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
