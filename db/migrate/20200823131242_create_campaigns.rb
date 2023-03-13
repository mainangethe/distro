class CreateCampaigns < ActiveRecord::Migration[6.0]
  def change
    create_table :campaigns, id: :uuid do |t|
      t.string :name, null: false
      t.integer :campaign_type, null: false
      t.integer :check_level, null: false, default: 1
      t.integer :status, null: false, default: 0
      t.references :entity, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
