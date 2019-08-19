class AddColumnsToItemarchive < ActiveRecord::Migration[5.2]
  def change
    add_column :itemarchives, :title, :string
    add_column :itemarchives, :status, :boolean
  end
end
