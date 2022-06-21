class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

  has_many :favorites

  def as_public_json
    as_json(
      except: %i[updated_at created_at password_digest]
    )
  end
end
