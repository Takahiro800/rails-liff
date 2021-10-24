class UsersController < ApplicationController
  def new
    @user = User.new()
  end

  def create
    @user = User.new(user_params)

    if params[:back].present?
      render :new
    end

    if @user.save
      # TagMailer.creation_email(@user.tag).deliver_now
      redirect_to admin_users_index_url
    else
      @user = User.new(user_params)
      @user.save
      render :new
    end
  end

  def edit
  end

  private

  def user_params
    params.require(:user).permit(:name, :tag)
  end
end
