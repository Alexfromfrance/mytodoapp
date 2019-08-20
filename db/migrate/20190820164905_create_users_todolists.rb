class CreateUsersTodolists < ActiveRecord::Migration[5.2]
  def change
    create_table :users_todolists do |t|
      t.references :user, foreign_key: true
      t.references :todolist, foreign_key: true

      t.timestamps
    end
  end
end
