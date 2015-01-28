class Question < ActiveRecord::Base
  scope(:not_answered, -> do
    where({:answered=> false})
  end)

  belongs_to(:survey)
end
