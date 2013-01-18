class LoginController < ActionController::Base
  layout 'layouts/default'

  # This canvas is shown during the login process
  def login
  end

  # This is the page that the user first sees after he installs the application
  def post_login
    @regular_page = Canvases.regular_page
  end

end

