class ListitemsController < ApplicationController

  def new
    @listitem = Listitem.new
    @todolist = Todolist.find(params[:todolist_id])
  end

  def create
    @listitem = Listitem.new(listitem_params)
    @todolist = Todolist.find(params[:todolist_id])
    @listitem.todolist = @todolist

    if @listitem.save
      redirect_to @todolist
    else
      render :new
    end
  end

  def show
    @listitem = Listitem.find(params[:id])
  end

  def edit
    @listitem = Listitem.find(params[:id])
  end

  def update
    if @listitem.update(listitem_params)
      redirect_to @todolist
    else
      render :edit
    end
  end

  def destroy
    @todolist = Todolist.find(params[:id])
    @listitem = @todolist.listitems.find(params[:todolist_id])
    @listitem.destroy
    redirect_to @todolist
  end

  def complete
    @todolist = Todolist.find(params[:id])
    @listitem = @todolist.listitems.find(params[:todolist_id])
    @listitem.update_attribute(:updated_at, Time.now)
    @itemarchive = Itemarchive.new()
    @itemarchive = @listitem.itemarchive
    raise
    # redirect_to @todolist, notice: "Item achevé"
  end

  private

  def listitem_params
    params.require(:listitem).permit(:title, :status)
  end

end
