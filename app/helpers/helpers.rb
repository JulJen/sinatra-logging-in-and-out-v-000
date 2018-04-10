class Helpers

  def current_user
  end

  def is_logged_in?
  end
  
  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end
