class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :watch, class_name: 'Watch::Model', foreign_key: 'watch_model_id'
end
