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

  


  # delete '/blogs/:id' do
  #  @blog = Blog.find_by(params[:id])
  #       if who_is_you?(@blog)
  #           @blog.destroy
  #           redirect '/blogs/index'
  #       else
  #           redirect '/blogs/index'
  #       end
  # end



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
