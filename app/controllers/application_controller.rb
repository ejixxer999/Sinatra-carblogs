require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "Blogs Post"
  end

  get "/" do
    erb :welcome
  end


  

  helpers do 
    def logged_in?
      !!current_author
    end 

    def current_author
      @current_author ||= Author.find_by(id: session[:id])
    end 

    def who_is_you?(blog)
      blog.author == current_author
    end 
  end


end
