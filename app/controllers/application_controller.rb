require './config/environment'
require './app/models/model'

class ApplicationController < Sinatra::Base

# this helps connect our public and views directories
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do 
    erb :index
  end

  get '/status' do
    erb :status 
  end
  
  post '/status' do
    @ranking1 = Ranking.new(params[:user_rating], params[:games_won], params[:games_lost], params[:opponent_score])
    erb :status
  end

end