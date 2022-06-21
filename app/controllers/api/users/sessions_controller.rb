class Api::Users::SessionsController < ApplicationController
  skip_before_action :authorized

  def create
    user = User.find_by(email: params[:email])
    if user
      if user.authenticate(params[:password])
        session[:user_id] = user.id
        render json: user.as_public_json, status: :ok
      else
        render json: { error: "Invalid password!" }, status: :unauthorized
      end
    else
      render json: { error: "User not found, please sign up!" }, status: :unauthorized
    end
  end

  def destroy
    # Create Logout destroy the session here
    session.delete :user_id
    head :ok
  end
end
