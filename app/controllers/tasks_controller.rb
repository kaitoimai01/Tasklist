class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @q = current_user.tasks.ransack(params[:q])
    @tasks = @q.result(distinct: true)
  end

  def show
  end

  def new
    @task = current_user.tasks.new
  end

  def create
    @task = current_user.tasks.new(task_params)

    if @task.save
      #TODO:追加後はtasks#indexに遷移させたい
      flash[:success] = 'タスクを追加しました。'
      redirect_to root_url
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
      #TODO:更新後はtasks#indexに遷移させたい
      redirect_to root_url
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
    @task = current_user.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :content, :deadline, :status, :priority)
  end
end
