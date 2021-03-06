class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :content
      t.date :deadline
      t.integer :priority
      t.integer :status

      t.timestamps
    end
  end
end
