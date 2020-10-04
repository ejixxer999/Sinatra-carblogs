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
            redirect '/login'

        end 

    end

    
    
    get '/signup' do 
        erb :signup
    end 

    post '/authors' do 
        if params[:email] != "" && params[:user_name] != "" && params[:password] != ""
            @author = Author.create(params)
            session[:id] = @author.id
            redirect "author/#{@author.id}"
        
        else
           redirect '/signup'
        end
    end
            

    get '/logout' do
        session.clear
        redirect '/'
    end 
    
    get '/author/:id' do 
        @author = Author.find_by(id: params[:id])

        erb :'/Authors/dashboard'
    end 
end 