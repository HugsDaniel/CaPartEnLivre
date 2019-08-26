class PagesController < ApplicationController
  def home
    @groups = current_user.groups if current_user
  end
end
