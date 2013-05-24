get '/' do
  "Listing of all scenarios if logged in"
end

get '/:uid' do
  redirect "/#{params[:uid]}/pick_a_side"
end

get '/:uid/pick_a_side' do
  haml :pick_a_side  
end

get '/:uid/categorize' do
  haml :categorize
end

get '/:uid/article/:id' do
  haml :article
end
