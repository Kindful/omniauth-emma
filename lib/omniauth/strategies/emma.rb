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

    end
  end
end
