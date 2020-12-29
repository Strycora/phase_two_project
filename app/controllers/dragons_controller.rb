class DragonsController < ApplicationController

  get '/dragons' do 
    @dragons = Dragon.all
    erb :'dragons/index'
  end

  get '/dragons/new' do
    erb :'dragons/new'
  end

  get '/dragons/:id' do 
    find_dragon
    erb :'dragons/show'
  end
  
  get '/dragons/:id/edit' do
    find_dragon
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

  patch "/dragons/:id" do
    find_dragon
    if @dragon.update(params[:dragon])
      redirect "/dragons/#{@dragon.id}"
    else
      redirect "/dragons/#{@dragon.id}/edit"
    end
  end

  private

  def find_dragon
    @dragon = Dragon.find_by_id(params[:id])
  end

end