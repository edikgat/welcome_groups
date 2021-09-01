class GroupsController < ApplicationController

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def edit
    group
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      flash[:notice] = "Group was created"
      redirect_to groups_path
    else
      render :new
    end
  end

  def update
    if group.update(group_params)
      flash[:notice] = "Group was updated"
      redirect_to groups_path
    else
      render :edit
    end
  end

  private

  def group
    @group ||= Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name)
  end
end
