require 'digest'
module TelestreamCloud

  API_PORT = 443
  US_API_HOST = "api.pandastream.com"
  EU_API_HOST = "api-eu.pandastream.com"
  GCE_API_HOST = "api-gce.pandastream.com"

  class Connection
    attr_accessor :api_host, :api_port, :access_key, :secret_key, :api_version, :factory_id

    def initialize(auth_params={})
      params = { :api_host => US_API_HOST, :api_port => API_PORT }.merge!(auth_params)
      @api_version = '3.0'

      @factory_id = params["factory_id"]  || params[:factory_id]
      @access_key = params["access_key"]  || params[:access_key]
      @secret_key = params["secret_key"]  || params[:secret_key]
      @api_host   = params["api_host"]    || params[:api_host]
      @api_port   = params["api_port"]    || params[:api_port]
      @prefix     = params["prefix_url"]  || "v#{api_version}"
    end

    def http_client
      TelestreamCloud::HttpClient::Faraday.new(api_url)
    end

    # Authenticated requests
    def get(request_uri, params={})
      sp = signed_params("GET", request_uri, params)
      http_client.get(request_uri, sp)
    end

    def post(request_uri, params={})
      if params[:signature_version] && params[:signature_version].to_i == 2
        sha = Digest::SHA256.new
        sha.update params.to_json

        sp = signed_params("POST", request_uri, {
                             signature_version: 2,
                             checksum: sha.hexdigest,
                           })

        begin
        http_client.post("#{request_uri}?#{ApiAuthentication.hash_to_query(sp)}", params, true)
        rescue Exception => ex
          puts ex
        end
      else
        sp = signed_params("POST", request_uri, params)
        http_client.post(request_uri, params.to_json)
      end
    end

    def put(request_uri, params={})
      sp = signed_params("PUT", request_uri, params)
      http_client.put(request_uri, sp)
    end

    def delete(request_uri, params={})
      sp = signed_params("DELETE", request_uri, params)
      http_client.delete(request_uri, sp)
    end

    # Signing methods
    def signed_query(*args)
      ApiAuthentication.hash_to_query(signed_params(*args))
    end

    def signed_params(verb, request_uri, params = {}, timestamp_str = nil)
      auth_params = stringify_keys(params)
      auth_params['factory_id'] = factory_id unless request_uri =~ /^\/factories/
      auth_params['access_key'] = access_key
      auth_params['timestamp']  = timestamp_str || Time.now.utc.iso8601(6)

      params_to_sign = auth_params.reject{|k,v| ['file'].include?(k.to_s)}
      auth_params['signature']  = ApiAuthentication.generate_signature(verb, request_uri, api_host, secret_key, params_to_sign)
      auth_params
    end

    def api_url
      "#{api_scheme}://#{api_host}:#{api_port}/#{@prefix}"
    end

    def api_scheme
      api_port.to_i == 443 ? 'https' : 'http'
    end

    # Shortcut to setup your bucket
    def setup_bucket(params={})
      granting_params = {
        :s3_videos_bucket => params[:bucket],
        :aws_access_key => params[:access_key],
        :aws_secret_key => params[:secret_key]
      }

      put("/factories/#{@factory_id}.json", granting_params)
    end

    def to_hash
      hash = {}
      [:api_host, :api_port, :access_key, :secret_key, :api_version, :factory_id].each do |a|
        hash[a] = send(a)
      end
      hash
    end

    private

    def stringify_keys(params)
      params.inject({}) do |options, (key, value)|
        options[key.to_s] = value
        options
      end
    end

  end
end
