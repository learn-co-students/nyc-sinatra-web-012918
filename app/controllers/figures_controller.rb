class FiguresController < ApplicationController
  set :views, 'app/views/figures'
  set :method_override, true


  get '/figures' do
    @figures = Figure.all
    erb :index
  end

  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :new
  end

  post '/figures' do

    @figure = Figure.create(params[:figure])
    if !params[:title][:name].empty?
      title = Title.create(params[:title])
      FigureTitle.create(title_id: title.id, figure_id: @figure.id)
    end
    if !params[:landmark][:name].empty?
      landmark = Landmark.create(name: params[:landmark][:name], figure_id: @figure.id)
    end
    erb :show
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @landmarks = @figure.landmarks
    @titles = @figure.titles
    erb :edit
  end

  patch '/figures' do
    @figure = Figure.find_by_id(params[:id])
    @figure = @figure.update(params[:figure])

    erb :show
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :show
  end
end
