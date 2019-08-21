class TodolistsController < ApplicationController
  before_action :set_todolist, only: [:show, :edit, :update, :destroy]

  def index
    @todolists = current_user.todolists
  end

  def show
    @user_todolist = UsersTodolist.new
  end

  def new
    @todolist = current_user.todolists.build
  end

  def create
    if @todolist = current_user.todolists.create(todolist_params)
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
    @todolist = current_user.todolists.find(params[:id])
  end
end
