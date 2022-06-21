class Watch::Family < ApplicationRecord
  belongs_to :brand, class_name: 'Watch::Brand', foreign_key: 'watch_brand_id'
  has_many :models, class_name: 'Watch::Model', foreign_key: 'watch_family_id'
end
