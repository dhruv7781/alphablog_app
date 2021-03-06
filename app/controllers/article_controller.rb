class ArticleController < ApplicationController
before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @articles = Article.all
  end
  
  def new
    @article = Article.new
  end

  def edit
  end

 


  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    @article.user = User.first
    if @article.save
      flash[:notice] = "Article was saved"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def update
   
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = "article was updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy
    
    @article.destroy
    redirect_to article_path(@article)
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end


end