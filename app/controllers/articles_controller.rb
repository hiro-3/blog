class ArticlesController < ApplicationController

  def index
    #binding.pry
    @articles = Article.order(created_at: :desc)
  end

  def new
    @articles = Article.new
  end

end
