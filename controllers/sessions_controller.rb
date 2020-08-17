require('sinatra')
require('sinatra/contrib/all')
require ('pry')
require_relative( '../models/session.rb' )
also_reload('../models/*')


get '/sessions/?' do
  @sessions = Session.all()
  erb(:"sessions/index")
end

get '/sessions/new' do
  erb( :"sessions/new" )
end

get '/sessions/:id/?' do
  @session = Session.find( params[:id] )
  @members_list = @session.list_of_members_booked_into_a_session()
  erb( :"sessions/show" )
end

post '/sessions/?' do
  @session = Session.new( params )
  @session.save
  erb( :"sessions/create" )
end

get '/sessions/:id/edit' do
  @session = Session.find( params[:id] )
  erb( :"sessions/edit" )
end

post '/sessions/:id/update' do
  Session.new( params ).update
  erb( :"sessions/update" )
end

post '/sessions/:id/delete' do
  @session = Session.find( params[:id] )
  @session.delete()
  erb( :"sessions/delete" )

end
