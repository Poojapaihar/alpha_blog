class StudentsController < ApplicationController

	def show
		@student= Student.find(params[:id])
		@articles = @student.articles
	end

	def new
		@student =Student.new
	end

	def edit
		@student= Student.find(params[:id])
	end

	def update
	    @student= Student.find(params[:id])
		if @student.update(student_params)
			flash[:notice]= "Your account information was successfully updated"
			redirect_to articles_path
		else
			render 'edit'
		end
	end

	def create
		@student = Student.new(student_params)

		if @student.save
			flash[:notice] = "Welcome to the Alpha Blog #{@student.username}, you have successfully signed up!!"
			redirect_to articles_path
		else
			render 'new'
		end
	end

	private

	def student_params
		params.require(:student).permit(:username, :email, :password)
	end

end
