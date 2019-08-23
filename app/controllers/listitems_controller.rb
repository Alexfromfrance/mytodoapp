class ListitemsController < ApplicationController

  def new
    @listitem = Listitem.new
    @todolist = Todolist.find(params[:todolist_id])
  end

  def create
    @listitem = Listitem.new(listitem_params)
    @todolist = Todolist.find(params[:todolist_id])
    @listitem.todolist = @todolist
    @listitem.status = false
    if @listitem.save
      redirect_to @todolist
    else
      render :new
    end
  end

  def adminshow
    if current_user.status == "admin"
    @todolists = Todolist.all
    @users = User.all
    else
      redirect_to todolists_path
    end
  end

  def show
    @listitem = Listitem.find(params[:id])
  end

  def taskdone
    @listitems = Listitem.where(status: true)
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

  def complete?
    @todolist = Todolist.find(params[:id])
    @listitem = @todolist.listitems.find(params[:todolist_id])
    return @listitem.status

    # @todolist = Todolist.find(params[:id])
    # @listitem = @todolist.listitems.find(params[:todolist_id])
    # @listitem.update_attribute(:updated_at, Time.now)
    # @itemarchive = Itemarchive.new(title: @listitem.title, status: @listitem.status)
    # @itemarchive.listitem = @listitem
    # if @itemarchive.save
    #   Listitem.find(@listitem.id).destroy
    #   redirect_to @todolist, notice: "Item archivé"
    # else
    #   redirect_to @todolist, notice: "Item non archivé"
    # end

    # redirect_to @todolist, notice: "Item achevé"
  end

  def complete
    @todolist = Todolist.find(params[:id])
    @listitem = @todolist.listitems.find(params[:todolist_id])
    @listitem.status = true
    if @listitem.save
      if @todolist.all_done?
        mail = UserMailer.todoempty(current_user, @todolist)
        mail.deliver_later
        redirect_to todolist_path(@todolist), notice: "Item archivé"
      else
        redirect_to todolist_path(@todolist), notice: "it works"
      end
    else
      redirect_to todolist_path(@todolist), notice: "Item non archivé"
    end
  end


  private

  def listitem_params
    params.require(:listitem).permit(:title, :status)
  end

end
