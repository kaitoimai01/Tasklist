class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @q = Task.ransack(params[:q])
    @tasks = @q.result(distinct: true)
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to root_path, notice: 'タスクが追加されました。'
    else
      flash[:danger] = 'タスクが追加できません。'
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to root_path, notice: 'タスクが更新されました。'
    else
      flash.now[:danger] = 'タスクが更新できませんでした。'
      render :edit
    end
  end

  def destroy
    @task.destroy

    redirect_to root_path, notice: 'タスクは削除されました。'
  end

  # Strong paramater
  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :content, :deadline, :status, :priority)
  end
end
