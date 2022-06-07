class StudentsController < ApplicationController

  def index
    students = if params[:name]
                (Student.where(first_name: params[:name]).first).or((Student.where(last_name: params[:name])).first)
    else
      Student.all
    end
    render json: students
  end

  def show
    student = Student.find(params[:id])
    render json: student
  end

end
