class AddForeignKeyToDocs < ActiveRecord::Migration[5.1]
  def change
  	add_index :docs, :comment_id
  end
end
