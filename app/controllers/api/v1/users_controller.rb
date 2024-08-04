# app/controllers/api/v1/base_api_controller.rb
class Api::V1::UsersController < Api::V1::BaseApiController
  skip_before_action :authenticate_user!, only: %i[resend_otp verify_otp]
  def profile
    render json: {
      status: {
        code: 200, message: 'User Profile fetch successfully.',
        data: { user: Users::DetailSerializer.new(current_user).serializable_hash[:data][:attributes] }
      }
    }, status: :ok
  end

  def resend_otp
    if params[:email].present?
      @user = User.find_by(email: params[:email])
      if @user.present?
        @user.update_and_send_otp_email
        render json: {
          status: {code: 200, message: 'OTP resend successfully.'},
        }
      else
        render json: {
          status: {message: "Invalid email. No record found."}
        }, status: :unprocessable_entity
      end
    else
      render json: {
        status: {message: "Please enter email."}
      }, status: :unprocessable_entity
    end
  end

  def verify_otp
    if params[:email].present? && params[:otp_code].present?
      @user = User.find_by(email: params[:email])
      if @user.present?
        if @user.confirmation_token == params[:otp_code]
          @user.update(confirmed_at: DateTime.now, is_email_verified: true)
          render json: {
            status: {code: 200, message: 'Email Verified successfully.'},
          }
        else
          render json: {
            status: {message: "Invalid OTP. Please try again."}
          }, status: :unprocessable_entity
        end
      else
        render json: {
          status: {message: "Invalid email. No record found."}
        }, status: :unprocessable_entity
      end
    else
      render json: {
        status: {message: "Wrong params. Please try again."}
      }, status: :unprocessable_entity
    end
  end
end