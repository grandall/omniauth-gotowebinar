require "omniauth/strategies/oauth2"

module OmniAuth
  module Strategies
    class GoToWebinar < OmniAuth::Strategies::OAuth2
      option :name, 'gotowebinar'

      option :client_options, {
        :site           => 'https://api.citrixonline.com',
        :authorize_url  => '/oauth/authorize',
        :token_url      => '/oauth/access_token'
      }

      option :provider_ignores_state, true

      option :token_params, {
        :header_format => 'OAuth oauth_token=%s',
        :param_name => 'access_token'
      }

      credentials do
        hash = {}
        hash.merge!('organizer_key' => access_token['organizer_key'])
        hash.merge!('account_key' => access_token['account_key'])
        hash
      end

    end
  end
end

OmniAuth.config.add_camelization 'gotowebinar', 'GoToWebinar'
