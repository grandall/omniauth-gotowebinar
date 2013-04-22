require 'spec_helper'
require 'omniauth-gotowebinar'
require 'openssl'
require 'base64'

describe OmniAuth::Strategies::GoToWebinar do
  before :each do
    @request = double('Request')
    @request.stub(:params) { {} }
    @request.stub(:cookies) { {} }
    @request.stub(:env) { {} }

    @client_id = '123'
    @client_secret = '53cr3tz'
  end

  subject do
    args = [@client_id, @client_secret, @options].compact
    OmniAuth::Strategies::GoToWebinar.new(nil, *args).tap do |strategy|
      strategy.stub(:request) { @request }
    end
  end

  it_should_behave_like 'an oauth2 strategy' do

    describe '#client' do
      it 'has correct GoToWebinar site' do
        subject.client.site.should eq('https://api.citrixonline.com')
      end

      it 'has correct authorize url' do
        subject.client.options[:authorize_url].should eq('/oauth2/authorize')
      end

      it 'has correct token url' do
        subject.client.options[:token_url].should eq('/oauth2/access_token')
      end
    end
  end
end
