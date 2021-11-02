class UsersController < ApplicationController
  require 'net/http'
  require 'uri'

  include AjaxHelper

  def index
    @users = User.all()
  end

  def new
    @user = User.new()
  end

  def create
    # @user = User.new(user_params)

    # if params[:back].present?
    #   render :new
    # end

    # if @user.save
    #   # TagMailer.creation_email(@user.tag).deliver_now
    #   redirect_to admin_users_index_url
    # else
    #   @user = User.new(user_params)
    #   @user.save
    #   render :new
    # end
    idToken = params[:idToken]
    channelId = ENV['CHANNEL_ID']
    res = Net::HTTP.post_form(URI.parse('https://api.line.me/oauth2/v2.1/verify'), {'id_token'=>idToken, 'client_id'=>channelId})
    line_user_id = JSON.parse(res.body)["sub"]
    user = User.find_by(line_user_id: line_user_id)
    if user.nil?
      user = User.create(line_user_id: line_user_id)
      session[:user_id] = user.id
      render :json => user
    elsif user
      session[:user_id] = user.id
      render :json => user
    end

    respond_to do |format|
      format.js { render ajax_redirect_to(user) }
    end
  end

  def show
    @user = User.find(params[:id])
    @tags = @user.tags
    @articles = @tags[0].fetch_qiita()
  end

  def edit
    @user = User.find(params[:id])
    @tags = @user.tags
  end

  def update
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_url, notice: "user#{user.id}」を削除しました"

  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
