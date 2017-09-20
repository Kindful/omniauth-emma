require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class Emma < OmniAuth::Strategies::OAuth2
    
      option :name, "emma"

      option :client_options, {
        :site               => "https://login.e2ma.net",
        :authorize_url      => '/oauth/authorize',
        :request_token_url  => "/oauth/token"
      }

      uid { access_token.params['emma_id'] }

      info do
        {
          'account_ids' => access_token.params['account_ids']
        }
      end

      extra do
        {
          raw_info: access_token
        }
      end

      protected

      # Overriding from omniauth/strategies/oauth2
      def build_access_token
        verifier = request.params["code"]

        #Strip query string to prevent redirect_uri mismatch
        redirect_uri = callback_url.split('?').first

        client.auth_code.get_token(verifier, { redirect_uri: redirect_uri }.merge(token_params.to_hash(symbolize_keys: true)), deep_symbolize(options.auth_token_params))
      end

    end
  end
end
