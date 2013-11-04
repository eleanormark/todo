class TasksController < ApplicationController

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:notice] = 'Your task has been created'
      redirect_to @task.list
    else
      @list = @task.list
      render 'lists/show'
    end
  end

  def edit 
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:notice] = "Your task was successfully updated"
      respond_to do |format|
        format.html { redirect_to @task.list }
        format.js
      end
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = "Your task was successfully destroyed"
    respond_to do |format|
      format.html { redirect_to @task.list}
      format.js
    end
  end


private

  def task_params
    params.require(:task).permit(:name, :done, :list_id)
  end
end