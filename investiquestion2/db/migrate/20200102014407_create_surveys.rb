class CreateSurveys < ActiveRecord::Migration[6.0]
  def change
    create_table :surveys do |t|
      t.references :user
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
