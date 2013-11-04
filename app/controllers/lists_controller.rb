class ListsController < ApplicationController
  def index
    @list = List.new
    @lists = List.all
  end

  def create
    @list = List.new(lists_params)
    if @list.save
      flash[:notice] = "Your list has been created."
      redirect_to lists_path
    else 
      @lists = List.all
      render :index
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    @list.update(lists_params)
    flash[:notice] = "Your list has been updated"
    redirect_to lists_path
    
  end

  def show
    @list = List.find(params[:id])
    @task = @list.tasks.new
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    flash[:notice] = "Your list has been deleted."
    redirect_to lists_path
  end

private
  def lists_params
    params.require(:list).permit(:name)
  end
end