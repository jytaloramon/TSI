class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.text :description, null: false
      t.boolean :is_active, null: false, :default => true
      t.date :date_task, null: false
      t.timestamps
    end
  end
end
