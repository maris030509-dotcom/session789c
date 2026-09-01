class GroupusersController < ApplicationController
  def create
    group = Group.find(params[:group_id])
    groupuser = Groupuser.new(user: current_user, group: group)

    if groupuser.save
      redirect_to group, notice: "参加しました"
    else
      redirect_to group, alert: "参加できませんでした"
    end
  end

  def destroy
    group = Group.find(params[:group_id])
    groupuser = Groupuser.find_by(user: current_user, group: group)

    groupuser.destroy
    redirect_to group, notice: "参加を解除しました"
  end
end
