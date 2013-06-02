def random_string(s)
  (0..s).map {
    ('a'..'z').to_a[rand(26)]
  }.join
end

def create_cookie(user)
  Digest::SHA1.hexdigest(user + random_string(20))
end

def login_as(user)
  # Registers cookie and adds reference to cookie in DB Model for given user
  cookie = create_cookie(user.name)
  session['argue-app'] = cookie
  user.cookie = cookie
  user.save
end

def logged_in_as
  # Determines currently logged in user via the provided cookie
  if !session['argue-app'].nil? then
    usersWithCookie = User.all(:cookie => session['argue-app'])
    return usersWithCookie.size == 1 ? usersWithCookie.first.name : nil
  else
    return nil
  end
end

def logout
  sesh = session['argue-app']
  if (!sesh.nil?) then
    user = User.all(:cookie => sesh).first
    user.cookie = nil
    user.save
    session.clear
  end
end
