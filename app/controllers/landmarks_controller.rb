class LandmarksController < ApplicationController
  # add controller methods
  get '/landmarks' do
    @landmarks = Landmark.all 
    erb :'/landmarks/index'
  end
  
  get '/landmarks/new' do
    @landmarks = Landmark.all 
    erb :'/landmarks/new'
  end
  
  post '/landmarks' do
    landmark = Landmark.create(params[:landmark])
    redirect "/landmarks/#{landmark.id}"
  end
  
  get '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    # binding.pry
    erb :'/landmarks/show'
  end
  
  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by_id(params[:id])
    # binding.pry
    erb :'/landmarks/edit'
  end
  
  patch '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    # binding.pry
    @landmark.update(params[:landmark])
    @landmark.save
    redirect "/landmarks/#{@landmark.id}"
  end


end
