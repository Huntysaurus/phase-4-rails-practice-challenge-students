class InstructorsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

    def index
        instructor = Instructor.all
        render json: instructor
    end

    def show
        instructor = found_instructor
        render json: instructor
    end

    def create
        instructor = Instructor.new(instructor_params)
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
        render json:{error: invalid.record.errors}, status: :render_unprocessable_entity
    end

end
