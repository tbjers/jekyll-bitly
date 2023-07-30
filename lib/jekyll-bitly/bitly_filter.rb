require "bitly"
require "singleton"
require "dry-core"
require "dry/core/cache"

module Jekyll
  class BitlyFilterCache
    include Singleton
    extend Dry::Core::Cache

    def initialize
      config = Jekyll.configuration({})
      token = if config && config["bitly"] && config["bitly"]["token"]
                config["bitly"]["token"]
              else
                ENV['BITLY_TOKEN']
              end
      @bitly_client = Bitly::API::Client.new(token: token) if token
    end

    def shorten(long_url)
      raise "Please setup the Bitly token first in _config.yml" if @bitly_client.blank?

      long_url.strip!
      fetch_or_store(self.class.to_s, long_url) do
        bitlink = @bitly_client.shorten(long_url: long_url)
        short_url = bitlink.link
        short_url
      end
    end
  end

  module BitlyFilter
    def bitly(long_url)
      BitlyFilterCache.instance.shorten(long_url)
    end
  end
end

Liquid::Template.register_filter(Jekyll::BitlyFilter)
