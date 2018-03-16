class CreateDocs < ActiveRecord::Migration[5.1]
  def change
    create_table :docs do |t|
      t.string :file
      t.integer :comment_id
      
      t.timestamps
    end
  end
end
