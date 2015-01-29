require('spec_helper')


describe(Survey) do

  it { should have_many(:questions) }


  it("converts the first word of title to uppercase") do
    survey = Survey.create({:survey_name => "sleeping hours"})
    expect(survey.survey_name()).to(eq("Sleeping hours"))
  end
end
