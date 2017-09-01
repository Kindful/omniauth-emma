require 'spec_helper'
require 'omniauth-emma'
require 'openssl'
require 'base64'

describe OmniAuth::Strategies::Emma do
  before :each do
    @request = double('Request')
    @request.stub(:params) { {} }
    @request.stub(:cookies) { {} }
    @request.stub(:env) { {} }

    @client_id = '321'
    @client_secret = 's3cr3tes'
  end

  subject do
    args = [@client_id, @client_secret, @options].compact
    OmniAuth::Strategies::Emma.new(nil, *args).tap do |strategy|
      strategy.stub(:request) { @request }
    end
  end

  it_should_behave_like 'an oauth2 strategy'

  describe '#client' do
    it 'has correct Emma site' do
      subject.client.site.should eq('https://login.e2ma.net')
    end

    it 'has correct authorize url' do
      subject.client.options[:authorize_url].should eq('/oauth/authorize')
    end

    it 'has correct token url' do
      subject.client.options[:token_url].should eq('/oauth/token')
    end
  end
end