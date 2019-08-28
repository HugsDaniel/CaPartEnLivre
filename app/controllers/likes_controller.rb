class LikesController < ApplicationController
  def create
    klass = params[:type].constantize
    @resource = klass.find(params[:resource_id])
    @like = Like.new
    @like.likable = @resource
    @like.user = current_user

    @like.save
    redirect_to group_path(id: @resource.group, previous: params[:type].to_s.downcase)
  end

  def destroy
    @like = Like.find(params[:id])
    @group = @like.likable.group
    @like.destroy

    redirect_to group_path(@group)
  end
end
