class CreateQuestions < ActiveRecord::Migration
  def change
    create_table(:questions) do |t|
      t.column(:open_question, :string)
      t.column(:answered, :boolean)
      t.column(:survey_id, :integer)
      t.timestamps
    end
  end
end
