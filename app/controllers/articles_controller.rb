class ArticlesController < ApplicationController
	before_action :find_article, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, only: [:index]

	def index
		@articles = Article.all
	end

	def new
		@article = current_user.articles.build
	end

	def create
		@article = current_user.articles.build(article_params)
		@article.save

		redirect_to articles_path
	end

	def show
	end

	def edit
	end

	def update
		@article.update(article_params)

		redirect_to articles_path
	end

	def destroy
		@article.destroy

		redirect_to articles_path
	end

	private

	def article_params
		params.require(:article).permit(:title, :description)
	end

	def find_article
		@article = Article.find(params[:id])
	end
end
