post '/session/:user/:uid' do
end

put '/session/:user/:uid' do
  status 200 
end

get '/session/:user/:uid' do
  error 401 if @user != params[:uid]

  #User.all(:number => )
end

delete '/session/:user/:uid' do

end
