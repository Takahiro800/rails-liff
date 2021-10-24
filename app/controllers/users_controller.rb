class UsersController < ApplicationController
  require 'net/http'
  require 'uri'
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
    render :json => res.body
  end

  def edit
  end

  private

  def user_params
    params.require(:user).permit(:name, :tag)
  end
end
