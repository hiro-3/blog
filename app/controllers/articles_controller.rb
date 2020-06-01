class ArticlesController < ApplicationController
  before_action :article_find, only:[:show,:edit,:update,:destroy]
  def index
    #binding.pry
    @articles = Article.order(created_at: :desc)
  end

  def show
  end

  def new
    @articles = Article.new
  end

  def create
    #binding.pry
    @articles = Article.new(article_params)
    if @articles.save
      redirect_to @articles, notice:"作成完了"
    else
      render :new, alert:"作成失敗"
    end
  end

  def edit
    #binding.pry
  end

  def update
    if @articles.update(article_params)
      redirect_to @articles, notice:"更新完了"
    else
      render :edit, alert:"更新失敗"
    end
  end

  def destroy
    if @articles.destroy
      redirect_to root_path, notice:"削除完了"
    else
      render  root_path, alrert:"削除失敗"
    end
  end

  private
    def article_find
     @articles = Article.find(params[:id])
    end

    def article_params
       params.require(:article).permit(:title,:content, :image, :created_at)
    end
end
