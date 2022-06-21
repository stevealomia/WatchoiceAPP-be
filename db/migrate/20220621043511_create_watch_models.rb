class CreateWatchModels < ActiveRecord::Migration[7.0]
  def change
    create_table :watch_models do |t|
      t.belongs_to :watch_family, null: false, foreign_key: true
      t.integer :watch_id
      t.string :name
      t.integer :market_price
      t.string :limited
      t.jsonb :case
      t.jsonb :dial
      t.jsonb :movement

      t.timestamps
    end

    add_index :watch_models, :watch_id
  end
end
