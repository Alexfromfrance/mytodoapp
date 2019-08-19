class CreateItemarchives < ActiveRecord::Migration[5.2]
  def change
    create_table :itemarchives do |t|

      t.timestamps
    end
  end
end
