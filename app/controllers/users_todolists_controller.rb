class UsersTodolistsController < ApplicationController

  def create
    @users_todolist = UsersTodolist.new
    @user = User.find_by_email(params[:users_todolist][:email])
    @todolist = Todolist.find(params[:todolist_id])
    unless @user.nil?
      @users_todolist.user = @user
      @users_todolist.todolist = @todolist
      @users_todolist.save
      redirect_to todolist_path(@todolist), notice: "L'utilisateur a bien été invité"
    else
      redirect_to todolist_path(@todolist), notice: "L'utilisateur n'existe pas, tester un autre ?"
    end
  end

end

# si l'utilisateur est en base je l'associe à @usertodolist
# sinon renvoyer un message d'erreur
