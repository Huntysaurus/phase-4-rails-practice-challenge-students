class InstructorsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

    def index
        instructor = Instructor.all
        render json: instructor, status: :ok
    end

    def show
        instructor = found_instructor
        render json: instructor, status: :ok
    end

    def create
        instructor = Instructor.create!(instructor_params)
        render json: instructor, status: :accepted
    end

    def update
        instructor = Instructor.find_by(id: params[:id])
        instructor.update(instructor_params)    
        render json: instructor, status: :accepted
    end

    def destroy
        instructor = found_instructor
        instructor.destroy
    end

    private

    def found_instructor
        Instructor.find(params[:id])
    end

    def instructor_params
        params.permit(:name)
    end

    def render_unprocessable_entity(invalid)
        render json:{error: invalid.record.errors}, status: :unprocessable_entity
    end

end
