class CreateWatchBrands < ActiveRecord::Migration[7.0]
  def change
    create_table :watch_brands do |t|
      t.string :name

      t.timestamps
    end
  end
end
