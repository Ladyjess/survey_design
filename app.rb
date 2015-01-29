require("bundler/setup")
Bundler.require(:default)


Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }



get('/') do
  erb(:homepage)
end


get('/surveys') do
  @surveys = Survey.all()
  erb(:survey)
end

post("/surveys") do
  survey_name = params.fetch("survey_name")
  survey = Survey.new({:survey_name => survey_name, :id => nil})
  survey.save()
  @surveys = Survey.all()
  erb(:survey)
end


get("/surveys/:id") do
  @survey = Survey.find(params.fetch("id").to_i())
  erb(:questions)
end

get("/surveys/:id/edit") do
  @survey = Survey.find(params.fetch("id").to_i())
  erb(:survey_edit)
end

patch("/surveys/:id") do
  survey_name = params.fetch("survey_name")
  @survey = Survey.find(params.fetch("id").to_i())
  @survey.update({:survey_name => survey_name})
  erb(:survey)
end

delete("/surveys/:id") do
  @survey = Survey.find(params.fetch("id").to_i())
  @survey.delete()
  @surveys = Survey.all()
  erb(:survey)
end


post("/surveys/:id/question_add") do
  open_question = params.fetch("open_question")
  @survey_id = params.fetch("id")
  @survey = Survey.find(@survey_id)
  @question = Question.create({:open_question => open_question, :survey_id => @survey_id, :answered => false})
  erb(:questions)
end

get("/questions/:id/") do
  @question = Question.find(params.fetch("id").to_i())
  @survey = @question.survey
  erb(:questions)
end

get("/questions/:id/edit") do
  @question = Question.find(params.fetch("id").to_i())
  erb(:question_edit)
end

patch("/questions/") do
  open_question = params.fetch("open_question")
  @question = Question.find(params.fetch("id").to_i())
  @question.update({:open_question => open_question})
  @survey = @question.survey
  erb(:questions)
end

delete("/questions/") do
  @question = Question.find(params.fetch("id").to_i())
  @question.delete()
  @questions = Question.all()
  @survey = @question.survey
  erb(:questions)
end
