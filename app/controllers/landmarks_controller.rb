class LandmarksController < ApplicationController

  set :views, 'app/views/landmarks'
  set :method_override, true

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :index
  end

  get '/landmarks/new' do
    erb :new
  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])
    @landmarks = Landmark.all
    erb :index
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :show
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :edit
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark = @landmark.update(params[:landmark])
    erb :show
  end

end
