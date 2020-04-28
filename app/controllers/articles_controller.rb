class ArticlesController < ApplicationController
  before_action :authenticate_user!,only: [:new, :update, :destroy]
  before_action :find_article, only: [:show, :update, :destroy, :registerable]
 
  def index
    @articles = Article.order(created_at: :desc)
  end

  def show
    @article = Article.find(params[:id])
  end


  def new
    @article = Article.new
  end

  def edit

  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save
      redirect_to @article, notice: '作成できました'
    else
      render :new, alert: '作成できませんでした'
    end
  end

  def update
    if　@article.update(article_params)
      redirect_to @article, notice: '更新できました'
    else
      render :edit, alert: '更新できませんでした'
    end
  end

  def destroy
    if @article.destroy
      redirect_to root_path, notice: '削除に成功しました'
    else
      redirect_to root_path, alert: '削除に失敗しました'
    end
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end




