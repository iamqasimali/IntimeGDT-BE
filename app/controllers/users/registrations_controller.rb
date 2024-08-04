# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  Devise::RegistrationsController
  include RackSessionsFix
  respond_to :json

  private

  def sign_up_params
    params.require(:user).permit(:name, :surname, :phone_number,  :email, :password, :dob, :driving_license_number)
          .tap do |whitelisted|
            whitelisted[:password_confirmation] = whitelisted[:password]
            whitelisted[:dob] = Date.parse(whitelisted[:dob]) if whitelisted[:dob].present?
          end
  end
  def respond_with(current_user, _opts = {})
    if resource.persisted?
      render json: {
        status: {code: 200, message: 'Signed up successfully.'},
        data: Users::DetailSerializer.new(current_user).serializable_hash[:data][:attributes]
      }
    else
      render json: {
        status: {message: "User couldn't be created successfully. #{current_user.errors.full_messages.to_sentence}"}
      }, status: :unprocessable_entity
    end
  end

end
