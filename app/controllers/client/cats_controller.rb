class Client::CatsController < ApplicationController

  def index
    @cats = Unirest.get("http://localhost:3000/api/cats").body
    render 'index.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    client_params = {
      name: params[:name],
      breed: params[:breed],
      age: params[:age],
      registry: params[:registry],
      image: params[:image]
    }
    cat = Unirest.post("http://localhost:3000/api/cats", parameters: client_params).body
    flash[:success] = "New Kitty created!"
    redirect_to "/client/cats/#{cat["id"]}"
  end

  def show
    cat = Unirest.get("http://localhost:3000/api/cats/#{params[:id]}")
    @cat = cat.body
    render 'show.html.erb'
  end

  def edit
    cat = Unirest.get("http://localhost:3000/api/cats/#{params[:id]}")
    @cat = cat.body
    render 'edit.html.erb'
  end

  def update
    client_params = {
      name: params[:name],
      breed: params[:breed],
      age: params[:age],
      registry: params[:registry],
      image: params[:image]
    }
    cat = Unirest.patch("http://localhost:3000/api/cats/#{params[:id]}", parameters: client_params).body
    flash[:success] = "Cat successfully updated!"
    redirect_to "/client/cats/#{cat['id']}"
  end

  def destroy
    response = Unirest.delete("http://localhost:3000/api/cats/#{params['id']}")
    flash[:success] = "The Kitty has been obliterated!"
    redirect_to "/client/cats"
  end
  
end