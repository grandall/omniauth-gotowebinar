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

      option :access_token_options, {
        :header_format => 'OAuth oauth_token=%s',
        :param_name => 'access_token'
      }

      option :token_params, {
        :parse          => :json
      }

      uid do
        raw_info['id']
      end

      info do
        {
          :expires_in => raw_info['expires_in'],
          :refresh_token => raw_info['refresh_token'],
          :organizer_key => raw_info['organizer_key'],
          :account_key => raw_info['account_key'],
          :account_type => raw_info['account_type']
        }
      end

      extra do
        {
          :raw_info => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/api/v1/account').parsed
      end

      ##
      # You can pass +display+, +with_offical_account+ or +state+ params to the auth request, if
      # you need to set them dynamically. You can also set these options
      # in the OmniAuth config :authorize_params option.
      #
      # /auth/weibo?display=mobile&with_offical_account=1
      #
      def authorize_params
        super.tap do |params|
          %w[display with_offical_account state].each do |v|
            if request.params[v]
              params[v.to_sym] = request.params[v]

              # to support omniauth-oauth2's auto csrf protection
              session['omniauth.state'] = params[:state] if v == 'state'
            end
          end
        end
      end
      
    end
  end
end

OmniAuth.config.add_camelization 'gotowebinar', 'GoToWebinar'
