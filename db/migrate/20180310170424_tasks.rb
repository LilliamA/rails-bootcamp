class Tasks < ActiveRecord::Migration[5.1]
  def change
  	create_table :tasks do |t|
      t.string :title
      t.integer :priority
      t.integer :status
      t.integer :project_id

      t.timestamps
    end
  end
end
