class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy toggle_status]

  # GET /tasks or /tasks.json
  def index
    @tasks = Task.all
    @incomplete_tasks = Task.where(status: 0)
  end

  def complete
    @completed_tasks = Task.where(status: 1)
  end

  # GET /tasks/1 or /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks or /tasks.json
  def create
    @task = Task.new(task_params)
  
    if @task.save
      redirect_to @task, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    @task = Task.find(params[:id])
  
    if @task.update(task_params)
      redirect_to @task, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy!

    respond_to do |format|
      format.html { redirect_to tasks_path, status: :see_other, notice: "Task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def toggle_status
    @task = Task.find(params[:id])
    @task.toggle_status

    if @task.status == 1
      redirect_to complete_path(@task), notice: 'Task marked as complete.'
    else
      redirect_to incomplete_path(@task), notice: 'Task status updated.'
    end
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :status, :category_id)
  end
end
