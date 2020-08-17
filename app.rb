require( 'sinatra' )
require( 'sinatra/contrib/all' ) if development?
require_relative( 'controllers/bookings_controller' )
require_relative( 'controllers/members_controller')
require_relative( 'controllers/sessions_controller')

get '/' do
  erb( :index )
end
