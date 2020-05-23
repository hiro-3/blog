class ArticlesController < ApplicationController
  before_action :find_article, only:[:show, :update, :edit, :destroy]
  def index
    @articles = Article.order(creat_at: :desc)
  end

  def show
  end

  def new
    @articles = Article.new
  end

  def creat
    @articles = Article.new(params_article)
    if @articles.save
       redirect_to @articles, notice:'作成成功'
    else
       render :new, alert:'作成失敗'
    end
  end

  def update
    if @articles.update(article_params)
       redirect_to @articles, notice:'更新成功'
    else
       render :edit, alert:'更新失敗'
    end
  end

  def edit
  end

  def destroy
    if
      @articles.destroy
      redirect_to root_path, notice: '削除完了'
    else
      redirect_to root_path, alert: '削除失敗'

    end
  end

  private

   def find_article
     @articles = Article.find(params[:id])
   end

   def article_params
     requ
   end
end
