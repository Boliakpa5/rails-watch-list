class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :destroy]

  def index
    @lists = List.all
  end

  def show
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(lists_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def edit
  # end

  # def update
  #   list = List.new(lists_params)
  #   list.save
  #   redirect_to list_path(list)
  # end

  def destroy
    @list.destroy
    redirect_to lists_path
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def lists_params
    params.require(:list).permit(:name, :photo)
  end
end
