class ArticlesController < ApplicationController

	before_action :set_article, only: [:show, :edit, :update, :destroy]

	before_action :require_student, except: [:show, :index]

	before_action :require_same_student, only: [:edit, :update, :destroy]

	def show
		# @article = Article.find(params[:id])		
	end

	def index
		@articles = Article.paginate(page: params[:page], per_page: 5)
	end

	def new
		@article = Article.new
	end

	def edit
		# byebug
		# @article = Article.find(params[:id])	
		
	end

	def create
		byebug
		# render plain: params[:article]
		@article = Article.new(article_params)
		@article.student = current_student

		if @article.save
			flash[:notice] = "Article was created successfully."
			redirect_to @article
		else
			render 'new'
		end
		# render plain: @article.inspect
		# redirect_to article_path(@article)
	end

	def update
		# byebug
		# @article = Article.find(params[:id])
		
		if @article.update(article_params)
			flash[:notice] = "Article was updated successfully"
			redirect_to @article
		else
			render 'edit'
		end
	end

	def destroy
		# @article = Article.find(params[:id])
		@article.destroy
		redirect_to @article
	end

	private

	def set_article
		@article = Article.find(params[:id])
	end

	def article_params
		params.require(:article).permit(:title, :description, category_ids: [])
	end

	def require_same_student
	    if current_student != @article.student && !current_student.admin?
	      flash[:alert] = "You can only edit or delete your own article"
	      redirect_to @article
	    end
  	end

end