
#This is the main application page

class HomeController < ActionController::Base

  def index
    if !Rails.application.config.respond_to?("app_id") || !Rails.application.config.respond_to?("app_secret") || !request.params.has_key?("token")
      return redirect_to "/landing"
    end

    site_base_url = Rails.application.config.site_base_url

    client = PlatformClient.new(request)
    @user = client.get("/users/current")

    @name = @user["name"]
    @profile_url = site_base_url +  @user["profileUrl"]
    @image_url = @user["imageUrl"]
    @user_id = @user["id"]

    followerIds = client.get("/users/followed-by",{:userId => @user["id"]})
    @followers = client.get("/users/get",{:ids=> followerIds })

    @followers = @followers.map do |f|
      f["profileUrl"] = site_base_url + f["profileUrl"]
      f
    end

  end

end