class ArticlesController < ApplicationController

before_action :set_articles, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to articles_path, success: 'Успішно збережено!'
    else
      flash.now[:danger] = 'НЕ збережено!'
      render :new
    end
  end

  def update
    if @article.update(article_params)
      redirect_to @article, success: 'Успішно оновлено!'
    else
      flash.now[:danger] = 'не оновлено!'
      render 'edit'
    end
  end

  def destroy
    @article.destroy

    redirect_to articles_path, success: 'Успішно видалено'
  end

  private

    def set_articles
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :text, :image)
    end

end
