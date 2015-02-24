class QuestionsController < ApplicationController

  def index
    @quiz = Quiz.find_by_id(params[:quiz_id])

  end

  def show

  end

  def new
    @quiz = Quiz.find_by_id(params[:quiz_id])
    @question = Question.new

  end

  def create
    @question = Question.new(question_params)
    respond_to do |format|
      if @question.save
        format.html { redirect_to :action => :new, notice: 'Question was succesfully created.'}
        format.js
        format.json { render json: @question, status: :created, location: @question}
      else
        format.html { render action: "new" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @quiz = Quiz.find_by_id(params[:quiz_id])
    @question = Question.find_by_id(params[:id])
    respond_to do |format|
      format.html { render :edit }
      format.json { render json: @selection }
    end
  end

  def update
    @question = Question.find_by_id(params[:id])
    @question.update(question_params)
    respond_to do |format|
      if @question.save
        format.html { redirect_to :action => :new, notice: 'Question was succesfully created.'}
        format.js
        format.json { render json: @question, status: :created, location: @question}
      else
        format.html { render action: "new" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy

  end

  private

  def question_params
   params.require(:question).permit(:question, :answer, :quiz_id)
  end

end
