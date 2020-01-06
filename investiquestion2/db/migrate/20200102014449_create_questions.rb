class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.references :survey
      t.string :question
      t.string :questionType
      t.text :choices, array: true, default: []

      t.timestamps
    end
  end
end
