class V1::PostsController < ApplicationController

    # GET /v1/exams
    def index
        exams = Exam.all
        render json: exams
    end

    # POST /v1/exams
    def create
        exam_params = params.require(:exam).permit(:category, :area, :description, :patient_id)
        exam = Exam.new(exam_params)

        if exam.save
        render json: exam, status: :created
        else
        render json: exam.errors, status: :unprocessable_entity
        end
    end

    # GET /v1/exams/:id
    def show
        exam = Exam.find(params[:id])
        render json: exam
    end

    # PATCH/PUT /v1/exams/:id
    def update
        exam = Exam.find(params[:id])
        exam_params= params.require(:exam).permit(:category, :area, :description, :patient_id)

        if exam.update(exam_params)
        render json: exam
        else
        render json: exam.errors, status: :unprocessable_entity
        end
    end

    # DELETE /v1/exams/:id
    def destroy
        exam = Exam.find(params[:id])
        exam.destroy
    end
end