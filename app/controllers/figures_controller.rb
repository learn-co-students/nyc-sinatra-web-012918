class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :"/figures/index"
  end

  get '/figures/new' do
    @figures = Figure.all
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"/figures/new"
  end

  post '/figures' do
    @figure = Figure.create(name: params[:figure][:name])
    if params[:figure][:title_ids]
      params[:figure][:title_ids].each {|title_id| @figure.titles << Title.find(title_id)}
    end
    if params[:figure][:landmark_ids]
      params[:figure][:landmark_ids].each {|landmark_id| @figure.landmarks << Landmark.find(landmark_id)}
    end
    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(name: params[:landmark][:name])
    end
    if !params[:title][:name].empty?
      @figure.titles << Title.create(name: params[:title][:name])
    end
    redirect '/figures'
  end

end
