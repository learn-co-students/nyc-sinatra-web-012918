class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :index
  end

end
