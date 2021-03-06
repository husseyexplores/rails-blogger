class ArticlesController < ApplicationController
  include ArticlesHelper
  before_action :require_login, except: [:index, :show]
  
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])

    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def new
    @article = Article.new
  end

  def create
    #  Bad idea - controller knows too much
    # @article = Article.new
    # @article.title = params[:article][:title]
    # @article.body = params[:article][:body]
    # @article.save

    # Better idea
    # @article = Article.new(
    #   title: params[:article][:title],
    #   body: params[:article][:body],
    #   )
    # @article.save

    # Even better - no need to make a new hash from an existing hash
    @article = Article.new(article_params) # article_params is coming from ArticlesHelper
    @article.save
    
    flash.notice = "'#{@article.title}' Created!"

    redirect_to article_path(@article)
  end
  
  def edit
    @article = Article.find(params[:id])
    
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    flash.notice = "'#{@article.title}' Updated!"

    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    flash.notice = "'#{@article.title}' Deleted!"

    redirect_to articles_path
  end 
end
