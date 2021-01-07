class DragonsController < ApplicationController

  get '/dragons' do
    redirect_if_not_logged_in 
    @dragons = Dragon.all
    @dragon = Dragon.find_by_id(session[:dragon_id])
    @user = current_user
    erb :'dragons/index'
  end

  get '/dragons/new' do
    redirect_if_not_logged_in
    erb :'dragons/new'
  end

  get '/dragons/:id' do 
    redirect_if_not_logged_in
    find_dragon
    redirect_if_not_found
    redirect_if_not_owner
    session[:dragon_id] = @dragon.id if @dragon
    erb :'dragons/show'
  end
  
  get '/dragons/:id/edit' do
    redirect_if_not_logged_in
    find_dragon
    redirect_if_not_found
    redirect_if_not_owner
    erb :'dragons/edit'
  end 

  post '/dragons' do
    dragon = current_user.dragons.build(params[:dragon])
    if dragon.save
      session[:dragon_id] = dragon.id
      redirect "/dragons"
    else
      flash[:errors] = dragon.errors.full_messages
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
      flash[:errors] = ["Dragon must have a name"]
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
    flash[:errors] = ["Dragon not found"] unless @dragon
    redirect '/dragons' unless @dragon
  end

  def redirect_if_not_owner
    flash[:errors] = ["That is not your dragon!"] unless @dragon.user == current_user
    redirect '/dragons' unless @dragon.user == current_user
  end
end