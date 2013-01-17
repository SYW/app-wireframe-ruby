class Canvases

  def self.landing_page
    Rails.application.config.site_base_url.to_s + "/app/" + Rails.application.config.app_id.to_s + "/l"
  end

  def self.install_page
    Rails.application.config.site_base_url.to_s + "/app/" + Rails.application.config.app_id.to_s + "/install"
  end

  def self.logic_page
    Rails.application.config.site_base_url.to_s + "/app/" + Rails.application.config.app_id.to_s + "/login"
  end

end
