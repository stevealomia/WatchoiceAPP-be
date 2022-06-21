class Api::Users::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def me
    render json: current_user.as_public_json, status: :ok
  end

  def create
    user = User.new(user_params)

    if user.save
      session[:user_id] = user.id
      render json: user.as_public_json, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: 422
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password)
  end
end
