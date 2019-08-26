class PagesController < ApplicationController
  def home
    @groups = current_user.groups.uniq if current_user
  end
end
