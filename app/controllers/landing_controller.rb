
#This is the application landing page, this page is public

class LandingController < ActionController::Base
  layout 'layouts/default'

  def landing
    if !Rails.application.config.respond_to?("app_id") || !Rails.application.config.respond_to?("app_secret")
      @configurations_missing = true
      return
    end

    @landing_page = Canvases.landing_page
    @install_page = Canvases.install_page
  end
end