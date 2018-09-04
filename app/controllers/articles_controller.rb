class ArticlesController < ApplicationController
  include ArticlesHelper
  
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
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

    redirect_to article_path(@article)
  end
end
