class ArticlesController < ApplicationController

  def index
    @article = Articles.all
  end

  def new
    @articles = Articles.new
  end
end
