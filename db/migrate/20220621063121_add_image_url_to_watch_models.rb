class AddImageUrlToWatchModels < ActiveRecord::Migration[7.0]
  def change
    add_column :watch_models, :image_url, :string
  end
end
