class Survey < ActiveRecord::Base
  has_many(:questions)
  validates(:survey_name, {:presence => true, :length => {:maximum => 30}})
  before_save(:capitalize_survey_name)


private

  define_method(:capitalize_survey_name) do
    self.survey_name=(survey_name().titleize())
  end
end
