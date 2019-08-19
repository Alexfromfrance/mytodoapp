class ListitemsController < ApplicationController

  def new
    @listitem = Listitem.new
  end

  def create
    @listitem = Listitem.new(listitem_params)
    @todolist = Todolist.find(params[:todolist_id])
    @listitem.todolist_id = @todolist
    if @listitem.save
      redirect_to @todolist
    else
      render :new
    end
  end

  def edit
    @listitem = Listitems.find(params[:id])
  end

  def update
    if @listitem.update(listitem_params)
      redirect_to @todolist
    else
      render :edit
    end
  end

  def destroy
    @listitem.destroy
    redirect_to @todolist
  end

  private

  def listitem_params
    params.require(:listitem).permit(:title, :status)
  end

end
