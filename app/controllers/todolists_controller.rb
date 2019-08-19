class TodolistsController < ApplicationController
  before_action :set_todolist, only: [:show, :edit, :update, :destroy]

  def index
    @todolists = Todolist.all
  end

  def show
  end

  def new
    @todolist = Todolist.new
  end

  def create
    @todolist = Todolist.new(todolist_params)
    if @todolist.save
      redirect_to @todolist
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @todolist.update(todolist_params)
      redirect_to @todolist
    else
      render :edit
    end
  end

  def destroy
    @todolist.destroy
    if @todolists.nil?
      redirect_to todolists_path
    else
      @todolists
    end
  end

  private

  def todolist_params
    params.require(:todolist).permit(:title, :description)
  end

  def set_todolist
    @todolist = Todolist.find(params[:id])
  end

end
