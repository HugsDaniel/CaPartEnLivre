class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @groups = current_user.groups if current_user
  end
end
