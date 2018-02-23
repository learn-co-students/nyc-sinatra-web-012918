class LandmarksController < ApplicationController
  set :views, Proc.new { File.join(root, "../views/landmarks") }
  register Sinatra::Twitter::Bootstrap::Assets
  set :method_override => true

#allows you to create a new landmark
get '/landmarks/new' do
  @titles = Title.all
  @figures = Figure.all
  erb :new
end
post '/landmarks' do
  # binding.pry
  @landmark = Landmark.create(params[:landmark])
  redirect to "/landmarks/#{@landmark.id}"
end
#allows you to list all landmarks
get '/landmarks' do
  @landmarks = Landmark.all
  erb :index
end

#allows you to see a single landmark"
get '/landmarks/:id' do
  @landmark = Landmark.find_by_id(params[:id])
  erb :show
end

patch '/landmarks/:id' do
  @landmark = Landmark.find_by_id(params[:id])
  @landmark.update(params[:landmark])
  # binding.pry
  if !params[:figure][:name].empty?
    @landmark.figure = Figure.create(params[:figure])
  end
  redirect to "/landmarks/#{@landmark.id}"
end



# allows you to edit a single landmark
get '/landmarks/:id/edit' do
  @landmark = Landmark.find_by_id(params[:id])
  erb :edit
end




end
