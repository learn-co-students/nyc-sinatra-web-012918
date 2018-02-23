class FiguresController < ApplicationController
  # set :views, "/views/figures"

  get '/' do
    erb :'/figures/index'
  end

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    if !params["title"]["name"].empty?
      @figure.titles << Title.create(name: params["title"]["name"])
    end
    if !params["landmark"]["name"].empty?
      @figure.landmarks << Landmark.create(name: params["landmark"]["name"])
    end
    @figure.save
    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    # binding.pry
    @figure = Figure.find(params[:id])
    @figure.update(params["figure"])
    if !params["title"]["name"].empty?
      new_title = Title.create(params["title"])
      @figure.titles << new_title
    end
    if !params["landmark"]["name"].empty?
      new_landmark = Landmark.create(params["landmark"])
      @figure.landmarks << new_landmark
    end
    @figure.save
    redirect to "figures/#{@figure.id}"
  end

  # post 'figures/:id/edit' do
  #   redirect "/figures/#{@figure.id/edit}"
  # end





end
