require 'openssl'

module EthorApi
  class Client

    API_VERSION = 'v1'
    DEFAULT_SERVERS = {
        :sandbox => 'https://ethor-test.apigee.net',
        :live => 'https://ethor-live.apigee.net'
      }

    attr_reader :consumer_key, :consumer_secret, :server, :connection

    def initialize(server, consumer_key = nil, consumer_secret = nil)
        @consumer_key = consumer_key
        @consumer_secret = consumer_secret
        @server = DEFAULT_SERVERS[server]

        @connection = Faraday.new({ url: @server, ssl: { verify: true } }) do |builder|
          # response
          builder.use Faraday::Response::RaiseError
          builder.response :json
          builder.adapter Faraday.default_adapter

          # request
          builder.request :multipart
          builder.request :json
        end
    end

    def store
      EthorApi::Api::Store.new(self)
    end

    def ticket
      EthorApi::Api::Ticket.new(self)
    end

    def menu
      EthorApi::Api::Menu.new(self)
    end

    def get(path, options = {})
      request(:get, parse_query_and_convenience_headers(path, options))
    end

    def post(path, options = {})
      request(:post, parse_query_and_convenience_headers(path, options))
    end

    private

    def parse_query_and_convenience_headers(path, options)
      raise 'Path can not be blank.' if path.to_s.empty?
      opts = { body: options[:body] }
      opts[:url]    = path
      opts[:method] = options[:method] || :get
      opts.tap {|p| p[:params] = (options[:params] || {}).merge({ apikey: @consumer_key }) }
    end

    def request(method, options = {})
      url     = "/#{API_VERSION}/" + options.fetch(:url)
      params  = options[:params] || {}
      body    = options[:body]
      headers = options[:headers]

      @connection.send(method) do |req|
        req.url(url)
        req.params.merge!(params)
        req.body = body.to_json
        req.headers['Content-Type'] = 'application/json'
      end
    end
  end
end