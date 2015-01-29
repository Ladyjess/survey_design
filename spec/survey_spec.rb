require('spec_helper')


describe(Survey) do

  it { should have_many(:questions) }


  it("converts the first word of title to uppercase") do
    survey = Survey.create({:survey_name => "sleeping hours"})
    expect(survey.survey_name()).to(eq("Sleeping hours"))
  end

  it("ensures the length of survey name is at most 30 characters") do
    survey = Survey.new({:survey_name => "a".*(31)})
    expect(survey.save()).to(eq(false))
  end
end
