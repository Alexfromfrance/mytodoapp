class AddItemarchiveToListitems < ActiveRecord::Migration[5.2]
  def change
    add_reference :listitems, :itemarchives, foreign_key: true
  end
end
