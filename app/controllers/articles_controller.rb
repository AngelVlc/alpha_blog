class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :destroy, :show]
  
  def index
    @articles = Article.paginate(page: params[:page], per_page: 1)
  end
  
  def new
    @article = Article.new  
  end
  
  def create    
    @article = Article.new(article_params)
    if @article.save     
      flash[:notice] = "Article created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end
  
  def show
  end
  
  def edit 
  end
  
  def update
    if @article.update(article_params)     
      flash[:notice] = "Article updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end
  
  def destroy
    @article.destroy
    
    flash[:notice] = "Article deleted"
    
    redirect_to articles_path
  end
  
  private 
  def set_article
    @article = Article.find(params[:id])
  end
  
  def article_params
    params.require(:article).permit(:title, :description)
  end
end