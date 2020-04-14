class CreateTaskLabels < ActiveRecord::Migration[5.2]
  def change
    create_table :task_labels do |t|
      t.references :task,  index: true, foreign_key: true
      t.references :label, index: true, foreign_key: true

      t.timestamps
    end
  end
end
