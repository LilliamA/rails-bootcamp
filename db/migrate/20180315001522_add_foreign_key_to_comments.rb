class AddForeignKeyToComments < ActiveRecord::Migration[5.1]
  def change
  	add_index :comments, :task_id
  end
end
