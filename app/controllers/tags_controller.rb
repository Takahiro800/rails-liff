class TagsController < ApplicationController
  def new
    @tag = Tag.new
  end

  def create
    current_user = User.find(session[:user_id])
    @tag = current_user.tags.new(tag_params)
    if @tag.save
      current_user.push_bot(current_user.line_user_id)
      redirect_to user_url(current_user.id)
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
