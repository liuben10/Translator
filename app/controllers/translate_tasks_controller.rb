class TranslateTasksController < ApplicationController
  before_action :set_translate_task, only: [:show, :edit, :update, :destroy]

  # GET /translate_tasks
  # GET /translate_tasks.json
  def index
    @translate_tasks = TranslateTask.all
  end

  # GET /translate_tasks/1
  # GET /translate_tasks/1.json
  def show
  end

  # GET /translate_tasks/new
  def new
    @translate_task = TranslateTask.new
  end

  # GET /translate_tasks/1/edit
  def edit
  end

  # POST /translate_tasks
  # POST /translate_tasks.json
  def create
    @translate_task = TranslateTask.new(translate_task_params)

    respond_to do |format|
      if @translate_task.save
        format.html { redirect_to @translate_task, notice: 'Translate task was successfully created.' }
        format.json { render :show, status: :created, location: @translate_task }
      else
        format.html { render :new }
        format.json { render json: @translate_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /translate_tasks/1
  # PATCH/PUT /translate_tasks/1.json
  def update
    respond_to do |format|
      if @translate_task.update(translate_task_params)
        format.html { redirect_to @translate_task, notice: 'Translate task was successfully updated.' }
        format.json { render :show, status: :ok, location: @translate_task }
      else
        format.html { render :edit }
        format.json { render json: @translate_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /translate_tasks/1
  # DELETE /translate_tasks/1.json
  def destroy
    @translate_task.destroy
    respond_to do |format|
      format.html { redirect_to translate_tasks_url, notice: 'Translate task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_translate_task
      @translate_task = TranslateTask.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def translate_task_params
      params.require(:translate_task).permit(:name, :source_language, :destination_language, :country, :owner_id, :translator_id)
    end
end
