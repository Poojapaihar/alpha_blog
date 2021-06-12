class StudentsController < ApplicationController

	def new
		@student =Student.new
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
