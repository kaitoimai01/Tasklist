class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @q = current_user.tasks.ransack(params[:q])
    @tasks = @q.result.eager_load(:labels, :task_labels).page(params[:page])
  end

  def show
  end

  def new
    @task = current_user.tasks.new
  end

  def create
    @task = current_user.tasks.new(task_params)

    if @task.save
      flash[:success] = 'タスクを追加しました。'
      redirect_to tasks_path
    else
      flash[:danger] = 'タスクが追加できません。'
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      flash[:success] = 'タスクが更新されました。'
      redirect_to tasks_path
    else
      flash.now[:danger] = 'タスクが更新できませんでした。'
      render :edit
    end
  end

  def destroy
    @task.destroy

    flash[:success] = 'タスクは削除されました。'
    redirect_to tasks_path
  end

  # Strong paramater
  private

  def set_task
    @task = current_user.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:label, :title, :content, :deadline, :status, :priority, label_ids: [])
  end
end
