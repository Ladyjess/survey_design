require('spec_helper')


describe(Question) do

  it { should belong_to(:survey) }



  it("validates the presence of question") do
    question = Question.new({:open_question => ""})
    expect(question.save()).to(eq(false))
  end

  it("ensures the length of open_questions is at most 75 characters") do
    question = Question.new({:open_question => "a".*(76)})
    expect(question.save()).to(eq(false))
   end

  describe(".not_answered") do
    it("returns the not answered questions") do
      open_question1 = Question.create({:open_question => "Do you like jelly?", :answered => false})
      open_question2 = Question.create({:open_question => "Do you partake in political activites?", :answered => false})
      open_questions = [open_question1, open_question2]
      answered_question = Question.create({:open_question => "Yes I like coffee", :answered => true})
      expect(Question.not_answered()).to(eq(open_questions))
    end
  end
end
