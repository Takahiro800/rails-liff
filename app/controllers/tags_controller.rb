class TagsController < ApplicationController
  def new
    @tag = Tag.new
  end

  def create
    # タスク
    if Rails.env.development?
      session[:user_id] = 2
    end

    current_user = User.find(session[:user_id])
    @tag = current_user.tags.new(tag_params)
    if AdminTag.find_by(name: tag_params[:name])
      if @tag.save
        text = "新しいタグ『#{tag_params[:name]}』を追加しました"

        message = {
          type: 'text',
          text: text
        }
        client = Line::Bot::Client.new { |config|
            config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
            config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
        }
        response = client.push_message(current_user.line_user_id, message)


        for i in 1..100 do
          qiita_article = @tag.fetch_article(page: i, limit: 100)
          break if qiita_article.present?
        end

        text = qiita_article["url"]
        message = {
          type: 'text',
          text: text
        }
        client = Line::Bot::Client.new { |config|
            config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
            config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
        }
        response = client.push_message(current_user.line_user_id, message)

        redirect_to user_url(current_user.id)
      end
    else
      redirect_to user_url(session[:user_id])
    end

  end

  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def destroy
    tag = Tag.find(params[:id])
    tag.destroy

    redirect_to user_url(session[:user_id])
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end

end
