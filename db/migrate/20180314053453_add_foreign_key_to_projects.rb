class AddForeignKeyToProjects < ActiveRecord::Migration[5.1]
  def change
  	add_index :projects, :user_id
  end
end
