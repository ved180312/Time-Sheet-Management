class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :project_name
      t.text :description
      t.date :onboarding_date
      t.integer :status, :default => 0
      t.timestamps
    end
  end
end
