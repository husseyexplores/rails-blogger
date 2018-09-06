class CommentsController < ApplicationController
  include CommentsHelper
  before_action :require_login, except: [:create]
  
  def create
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]

    @comment.save

    redirect_to article_path(@comment.article)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    flash.notice = "'#{@comment.id}' Deleted!"

    redirect_back fallback_location: articles_path
  end
end
