class DragonsController < ApplicationController

  get '/dragons' do 
    @dragons = Dragon.all
    @dragon = Dragon.find_by_id(session[:dragon_id])
    erb :'dragons/index'
  end

  get '/dragons/new' do
    erb :'dragons/new'
  end

  get '/dragons/:id' do 
    session[:dragon_id] = @dragon.id if @dragon
    find_dragon
    redirect_if_not_found
    erb :'dragons/show'
  end
  
  get '/dragons/:id/edit' do
    find_dragon
    redirect_if_not_found
    erb :'dragons/edit'
  end 

  post '/dragons' do
    dragon = Dragon.new(params[:dragon])

    if dragon.save
      redirect '/dragons'
    else
      redirect 'dragons/new'
    end
  end

  patch '/dragons/:id' do
    find_dragon
    redirect_if_not_found
    if @dragon.update(params[:dragon])
      redirect "/dragons/#{@dragon.id}"
    else
      redirect "/dragons/#{@dragon.id}/edit"
    end
  end

  delete '/dragons/:id' do
    find_dragon
    @dragon.destroy if @dragon
    redirect '/dragons'
  end
      

  private

  def find_dragon
    @dragon = Dragon.find_by_id(params[:id])
  end

  def redirect_if_not_found
    redirect '/dragons' unless @dragon
  end

end