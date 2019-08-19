class RemoveItemarchivesFromListitem < ActiveRecord::Migration[5.2]
  def change
    remove_reference :listitems, :itemarchives, foreign_key: true
  end
end
