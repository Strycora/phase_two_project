class DragonsController < ApplicationController

  get '/dragons' do 
    @dragons = Dragon.all
    find_dragon
    @user = current_user
    erb :'dragons/index'
  end

  get '/dragons/new' do
    erb :'dragons/new'
  end

  get '/dragons/:id' do 
    find_dragon
    session[:dragon_id] = @dragon.id if @dragon
    redirect_if_not_found
    redirect_if_not_owner
    erb :'dragons/show'
  end
  
  get '/dragons/:id/edit' do
    find_dragon
    redirect_if_not_found
    redirect_if_not_owner
    erb :'dragons/edit'
  end 

  post '/dragons' do
    dragon = Dragon.create(name: params[:dragon][:name], color: params[:dragon][:color], breed: params[:dragon][:breed], personality: params[:dragon][:personality], treasure: params[:dragon][:treasure],  user_id: current_user.id)
    session[:dragon_id] = dragon.id
    if dragon.save
      redirect '/dragons'
    else
      redirect 'dragons/new'
    end
  end

  patch '/dragons/:id' do
    find_dragon
    redirect_if_not_found
    redirect_if_not_owner
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
    # @dragon = Dragon.find_by_id(params[:id])
    @dragon = Dragon.find_by_id(session[:dragon_id])
  end

  def redirect_if_not_found
    redirect '/dragons' unless @dragon
  end

  def redirect_if_not_owner
    redirect '/dragons' unless @dragon.user == current_user
  end
end