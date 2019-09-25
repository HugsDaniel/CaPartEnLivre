class Api::V1::PodcastsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @podcasts = Podcast.all

    render json: @podcasts
  end
end
