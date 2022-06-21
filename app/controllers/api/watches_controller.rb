class Api::WatchesController < ApplicationController
  skip_before_action :authorized

  def index
    watches = Watch::Model.limit(100)

    render json: {
      data: watches.map do |watch|
        watch.as_json.merge(
          favorited: favorite_watch_ids.include?(watch.id)
        )
      end
    }
  end

  private

  def favorite_watch_ids
    @favorite_watch_ids ||= begin
      if login?
        current_user.favorites.pluck(:watch_model_id)
      else
        []
      end
    end
  end
end
