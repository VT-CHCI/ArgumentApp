def random_string(s)
  (0..s).map {
    ('a'..'z').to_a[rand(26)]
  }.join
end

def create_cookie(user)
  Digest::SHA1.hexdigest(user + random_string(20))
end

def login_as(user)
  cookie = create_cookie(user.name)
  session['argue-app'] = cookie
  user.cookie = cookie
  user.save
end

def logout
  sesh = session['argue-app']
  if sesh.nil?
    user = User.all(:cookie => sesh).first
    user.cookie = nil
    user.save
    session.clear
  end
end
