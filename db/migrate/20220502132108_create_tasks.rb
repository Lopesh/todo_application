class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.datetime :deadline
      t.references :user
      t.integer :status, default: 1
      t.timestamps
    end
  end
end
