class Helpers

  def current_user # accepts the session hash as an argument
    # uses the user_id from the session hash to find the user in the database and return that user
  end

  def is_logged_in? #accepts the session hash as an argument
    #returns true if the user_id is in the session hash and false if not.The Ruby !! operator will come in handy here.
  end

end
