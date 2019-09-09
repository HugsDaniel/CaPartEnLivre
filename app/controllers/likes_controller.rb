class LikesController < ApplicationController
  def create
    klass = params[:type].constantize
    @resource = klass.find(params[:resource_id])
    @group = @resource.group
    @like = Like.new
    @like.likable = @resource
    @like.user = current_user

    @like.save
    redirect_to "/groups/#{@group.id}/#{params[:type].to_s.downcase.pluralize}"
  end

  def destroy
    @like = Like.find(params[:id])
    @resource = @like.likable_type.downcase.pluralize
    @group = @like.likable.group
    @like.destroy

    redirect_to "/groups/#{@group.id}/#{@resource}"
  end
end
