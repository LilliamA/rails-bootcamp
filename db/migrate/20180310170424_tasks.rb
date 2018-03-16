class Tasks < ActiveRecord::Migration[5.1]
  def change
  	create_table :tasks do |t|
      t.string :title
      t.integer :priority

      t.references :project, foreign_key: { to_table: :projects, on_delete: :cascade }
      t.timestamps
    end
  end
end
