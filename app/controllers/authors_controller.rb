class AuthorsController < ApplicationController
    #login 
    get '/login' do 
        erb :login
    end 
#create a session 
#find user
#auth user
#log user
#user specific dashboard
    post '/login' do
        @author = Author.find_by(user_name: params[:user_name])
        if @author.authenticate(params[:password])
            session[:id] = @author.id
            puts session
            redirect "author/#{@author.id}"

        else

        end 

    end

    get '/signup' do 
    end 
    
    get '/author/:id' do 
        "Welcome to your dashboard"
    end 
end 