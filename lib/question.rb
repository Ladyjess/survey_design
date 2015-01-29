class Question < ActiveRecord::Base
  belongs_to(:survey)
  validates(:open_question, {:presence => true, :length => {:maximum => 75}})

  scope(:not_answered, -> do
    where({:answered=> false})
  end)
end
