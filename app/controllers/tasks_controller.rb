class TasksController < ApplicationController
  def show
    @task = Task.find(params[:id])
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
    @task = Task.find(params[:id])
  end

  def update
  end

  def destroy
  end

  # Strong paramater
  def task_params
    params.require(:task).permit(:title, :content)
  end
end
