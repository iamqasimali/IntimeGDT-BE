class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  include Users::Enums
  include Users::Helpers

  devise :database_authenticatable, :registerable, :recoverable, :validatable, :trackable ,
         :jwt_authenticatable, jwt_revocation_strategy: self

  # after_create :update_and_send_otp_email

  #Relationships
  has_one :provider

  #Enums
  enum role: ROLES
end