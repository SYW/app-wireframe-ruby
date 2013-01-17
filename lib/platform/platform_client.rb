require 'rest_client'
require 'uri'
require 'json'

#
# This client can be used to call all the APIs, to see a list of the APIs go to
#

class PlatformClient

  def initialize(req)
    @req = req
  end

  def get(url,params = nil)

    base_url = Rails.application.config.api_base_url.to_s
    token = @req.params["token"]
    hash = get_hash(token)

    params = get_call_params(hash, params, token)

    apiPath = URI.join(base_url, url).to_s
    response = RestClient.get apiPath, {:params => params , :content_type => :json }

    return parse_response(response)

    end

  def parse_response(response)
    parsed_response = JSON.parse(response)
    parsed_response
  end

  def get_call_params(hash, params, token)
    if params.nil?
      params = Hash.new
    end

    client_params = {:token => token, :hash => hash}

    params.merge!(client_params)

    params.keys.each do |key|
      val = params[key]

      if val.is_a?(Array)
         params[key]= val.join(',')
      end
    end

    params
  end

  def get_hash(token)
    app_secret = Rails.application.config.app_secret
    Digest::SHA256.hexdigest(token + app_secret)
  end
end