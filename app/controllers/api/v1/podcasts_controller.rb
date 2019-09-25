class Api::V1::PodcastsController < Api::V1::BaseController
  def index
    @podcasts = Podcast.all
  end
end
