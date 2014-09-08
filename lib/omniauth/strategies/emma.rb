require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class Emma < OmniAuth::Strategies::OAuth2
      DEFAULT_RESPONSE_TYPE = 'code'
      DEFAULT_GRANT = 'authorization_code'

      option :name, "emma"

      option :client_redirect_uri

      option :client_options, {
        site: "https://login.e2ma.net",
        authorize_url: "https://login.e2ma.net/oauth/authorize",
        token_url: "https://login.e2ma.net/oauth/token" }

      uid { request.params[:code] }

      def authorize_params
        super.tap do |params|
          params[:response_type] ||= DEFAULT_RESPONSE_TYPE
          params[:client_id] = client.id
          params[:redirect_uri] = options.client_redirect_uri
        end
      end

      def token_params
        super.tap do |params|
          params[:grant_type] ||= DEFAULT_GRANT
          params[:client_id] = client.id
          params[:client_secret] = client.secret
        end
      end
    end
  end
end