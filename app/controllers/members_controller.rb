class MembersController < ApplicationController
  before_action :set_group

  def new
    @membership = Membership.new
  end

  def create
    @membership = Membership.new(membership_params)
    @membership.group = @group

    if @membership.save
      redirect_to group_path(@group), notice: "Bien ajouté(e) !"
    else
      render :new
    end
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def membership_params
    params.require(:membership).permit(:user_id)
  end
end
