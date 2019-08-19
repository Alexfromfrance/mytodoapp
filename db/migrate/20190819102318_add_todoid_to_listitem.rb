class AddTodoidToListitem < ActiveRecord::Migration[5.2]
  def change
    add_reference :listitems, :todolist, foreign_key: true
  end
end
