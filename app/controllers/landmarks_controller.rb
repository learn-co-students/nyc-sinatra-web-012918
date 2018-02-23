class LandmarksController < ApplicationController
  set :views, 'app/views/landmarks'
  set :method_override, true

  #read all landmarks
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :index
  end

  #create a new landmark

  get '/landmarks/new' do
    erb :new
  end

  post '/landmarks' do
    @landmark = Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])
    erb :index
  end

  #read one
  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :show
  end

  #edit one
  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    @figure = @landmark.figure
    erb :edit
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    # @landmark.update(params[:landmark])
    @landmark.year_completed = params[:landmark][:year_completed]

    @landmark.name = params[:landmark][:name]
    @landmark.save
    erb :show
  end
end
