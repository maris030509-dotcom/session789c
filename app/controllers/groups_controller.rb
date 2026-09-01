class GroupsController < ApplicationController
  def index
    @groups = Group.all.order(created_at: :desc)
  end
  
  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.owner = current_user   # 作成者を紐づける

    if @group.save
      redirect_to @group, notice: "グループを作成しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to @group, notice: "グループを更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :description, :image)
  end
end
