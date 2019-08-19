class AddListItemToItemarchive < ActiveRecord::Migration[5.2]
  def change
    add_reference :itemarchives, :listitem, foreign_key: true
  end
end
