class LandmarksController < ApplicationController
  set :method_override, true

  get '/landmarks' do
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    @landmarks = Landmark.all
    @figures = Figure.all
    @titles = Title.all
    erb :'/landmarks/new'
  end

  post '/landmarks' do
    @landmark = Landmark.create(name: params[:landmark_name], year_completed: params[:landmark_year_completed])
    redirect '/landmarks'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/edit'
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.update(name: params[:name], year_completed: params[:year_completed])
    binding.pry
    @landmark.save
    redirect "/landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end


end
