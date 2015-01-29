class CreateSurveys < ActiveRecord::Migration
  def change
    create_table(:surveys) do |t|
      t.column(:survey_name, :string)

      t.timestamps()
    end
  end
end
