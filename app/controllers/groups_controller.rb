class GroupsController < ApplicationController

  def index
    @groups = group_scope
  end

  def show
    authorize_group
    @group_chat = GroupChatRepresenter.new(group).as_json
  end

  def new
    @group = current_user.groups.new
    authorize_group
  end

  def edit
    authorize_group
  end

  def create
    @group = current_user.groups.new(group_params)
    authorize_group
    if @group.save
      flash[:notice] = 'Group was created'
      redirect_to groups_path
    else
      render :new
    end
  end

  def update
    authorize_group
    if group.update(group_params)
      GroupChat::GroupRenamedBroadcastJob.perform_later(group.id)
      flash[:notice] = 'Group was updated'
      redirect_to groups_path
    else
      render :edit
    end
  end

  def destroy
    authorize_group
    group.destroy
    GroupChat::GroupRemovedBroadcastJob.perform_later(group.id)
    flash[:notice] = 'Group was removed'
    redirect_to groups_path
  end

  private

  def group
    @group ||= group_scope.find(params[:id])
  end

  def group_scope
    policy_scope(Group)
  end

  def authorize_group
   authorize group
  end

  def group_params
    params.require(:group).permit(:name)
  end
end
