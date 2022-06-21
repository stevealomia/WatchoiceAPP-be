class Watch::Brand < ApplicationRecord
  has_many :families, class_name: 'Watch::Family', foreign_key: 'watch_brand_id'
end
