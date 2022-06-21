class CreateWatchFamilies < ActiveRecord::Migration[7.0]
  def change
    create_table :watch_families do |t|
      t.belongs_to :watch_brand, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
