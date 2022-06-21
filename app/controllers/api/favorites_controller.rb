class Api::FavoritesController < ApplicationController
  def index
    render json: {
      data: current_user.favorites.includes(:watch).map do |favorite|
        favorite.watch.as_json.merge(
          favorited: true
        )
      end
    }
  end

  def create
    watch = Watch::Model.find(params[:watch_id])
    favorite = Favorite.where(watch: watch, user: current_user).first_or_initialize

    if favorite.new_record? && favorite.save
      render json: { data: watch.as_json.merge(favorited: true), message: "Successfully added to favorite" }
    elsif favorite.destroy
      render json: { data: watch.as_json.merge(favorited: false), message: "Successfully delete favorite" }
    else
      render json: { errors: favorite.errors.full_messages }, status: 422
    end
  end
end
