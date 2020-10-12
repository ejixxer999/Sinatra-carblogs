class BlogsController < ApplicationController
    get '/blogs/new' do
        erb :'/blogs/new'
    end 

   

    post '/blogs' do 
        if !logged_in?
            redirect '/'
        end 
    
        if params[:info] != ""
            @blog = Blog.create(info: params[:info], author_id: current_author.id)
            redirect "/blogs/#{@blog.id}"
        else
            redirect '/blogs/new'
        end
    end

    get '/blogs/index'do
        @blogs = Blog.all
        erb :'blogs/index'
    end 


    get '/blogs/:id' do 
        @blog = Blog.find(params[:id])
        erb :'/blogs/display'
    end

    get '/blogs/:id/edit' do
        @blog = Blog.find(params[:id])
       if logged_in?
            if who_is_you?(@blog)
                erb :'/blogs/edit'
            else
                redirect "author/#{current_author.id}"
            end 
        else
            redirect '/'
        end 
    end 

    patch '/blogs/:id' do 
       @blog = Blog.find(params[:id])
        if logged_in?
            if who_is_you?(@blog) && params[:info] !=""
                @blog.update(info: params[:info])
                redirect "/blogs/#{@blog.id}"
            else
                redirect '/blogs/index'

            end 
        else
            redirect '/'
        end
    end

    delete '/blogs/:id' do
        @blog = Blog.find_by(params[:id])
        if who_is_you?(@blog)
            @blog.destroy
            redirect '/blogs/index'
        else
            redirect '/blogs/index'
        end
    end
    

end 


 
