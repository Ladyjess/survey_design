class Question < ActiveRecord::Base
  belongs_to(:survey)

  scope(:not_answered, -> do
    where({:answered=> false})
  end)
end
