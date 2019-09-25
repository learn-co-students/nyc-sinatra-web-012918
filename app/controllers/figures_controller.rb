class FiguresController < Sinatra::Base

  set :views, Proc.new { File.join(root, "../views/figures") }
  register Sinatra::Twitter::Bootstrap::Assets
  set :method_override => true



#allows you to create a new figure with a landmark
#allows you to create a new figure with a new title
#allows you to create a new figure with a new landmark
  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :new
  end

#allows you to list all figures
  get '/figures' do
    @figures = Figure.all
    erb :index
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    # binding.pry
    if !params[:landmark].empty?
      @figure.landmarks << Landmark.create(name: params[:landmark][:name],year_completed: params[:landmark][:year_completed])
    end
    if !params[:title].empty?
      @figure.titles << Title.create(params[:title])
    end
    redirect to "/figures/#{@figure.id}"

  end

#allows you to see a single Figure
  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :show
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    # binding.pry
    @figure.update(params[:figure])

    if !params[:landmark].empty?
      @figure.landmarks << Landmark.create(name: params[:landmark][:name],year_completed: params[:landmark][:year_completed])
    end
    if !params[:title].empty?
      @figure.titles << Title.create(params[:title])
    end
    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    @landmarks = Landmark.all
    @titles = Title.all
    erb :edit
  end


#allows you to view form to edit a single figure
  post '/figures/:id/edit' do
    redirect to "/figures/#{@figure.id}/edit"
  end



end
