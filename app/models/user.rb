class User < ApplicationRecord
  validates :username, :uniqueness => {case_sensitive: false}
  has_secure_token :auth_token
  has_secure_password

  has_many :study_plans, dependent: :destroy
end
