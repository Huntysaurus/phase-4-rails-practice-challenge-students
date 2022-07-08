class StudentsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

    def index
        students = Student.all
        render json: students
    end

    def show
        student = found_student
        render json: student
    end

    def create
        student = Student.create!(student_params)
        render json: student, status: :accepted
    end

    def update
        student = Student.find_by(id: params[:id])
        student.update(student_params)
        render json: student, status: :accepted
    end

    def destroy
        student = found_student
        student.destroy
    end

    private

    def student_params
        params.permit(:name, :major, :age)
    end

    def found_student
        Student.find(params[:id])
    end

    def render_unprocessable_entity(invalid)
        render json:{error: invalid.record.errors}, status: :unprocessable_entity
    end


end
