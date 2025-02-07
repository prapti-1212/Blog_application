class Api::V1::SigninController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    user = User.find_for_database_authentication(email: params[:email])

    if user&.valid_password?(params[:password])
      sign_in(user)
      render json: { message: "Signed in successfully", user: user }, status: :ok
    else
      render json: { errors: "Invalid email or password" }, status: :unauthorized
    end
  end
end
