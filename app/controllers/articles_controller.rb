class ArticlesController < ApplicationController
  before_filter :require_login, :only => [:new, :create, :edit, :update, :destroy]

  respond_to :html, :xml
  def index

    @articles = Article.all
    
    case params[:type]
    when 'month'
      # check to see if the month is a numeric value between 1 and 12
      if ((1..12).include?(params[:month].to_i))
        @articles = Article.by_month(params[:month].to_i, :field => :created_at)
        @articles_displayed = Date::MONTHNAMES[params[:month].to_i]
      end
      #Finds the top 3 articles
    when 'popular'
        @articles = Article.find(:all, :limit => 3, :order => 'view_count desc')
        @articles_displayed = 'Popular'
    end
  end

  def show
    @article = Article.find(params[:id])
    @view_count = @article.increment_view

    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params[:article])
    @article.save

    flash[:message] = "Article '#{@article.title}' Created!"

    redirect_to article_path(@article)
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy

    flash[:message] = "Article '#{article.title}' Deleted!"

    redirect_to articles_path
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update_attributes(params[:article])

    flash[:message] = "Article '#{@article.title}' Updated!"

    redirect_to article_path(@article)
  end
end
