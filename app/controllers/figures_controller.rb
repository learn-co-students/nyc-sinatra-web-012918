class FiguresController < ApplicationController
  get '/figures' do
    erb  :'figures/index'
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"/figures/new"
  end

  post '/figures' do
    @figure = Figure.create(params["figure"])
    if !params["title"]["name"].empty?
      title = Title.create(params["title"])
      @figure.titles << title
    end
    if !params["landmark"]["name"].empty?
      @figure.landmarks << Landmark.create(name: params["landmark"]["name"], year_completed: params["landmark"]["year_completed"])
    end
    @figure.save
    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find_by(id: params[:id])
    @landmark = Landmark.all.select{|landmark| landmark.figure == @figure}
    @title = Title.all.select{|title| title.figures == @figure}
    erb :"/figures/show"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by(id: params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"/figures/edit"
  end

  patch '/figures/:id' do
    @figure = Figure.find_by(id: params[:id])
    @figure.update(params["figure"])
    if !params["title"]["name"].empty?
      title = Title.create(params["title"])
      @figure.titles << title
    end
    if !params["landmark"]["name"].empty?
      @figure.landmarks << Landmark.create(name: params["landmark"]["name"], year_completed: params["landmark"]["year_completed"])
    end
    @figure.save
    redirect "/figures/#{@figure.id}"
  end
end
