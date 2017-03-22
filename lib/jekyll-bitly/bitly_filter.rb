require "bitly"

module Jekyll
  class BitlyFilterCache
    def initialize
      @result_cache = {}
      config = Jekyll.configuration({})
      return nil unless config && config["bitly"] && config["bitly"]["username"]
      @username = config["bitly"]["username"]
      @key = config["bitly"]["api_key"]
      Bitly.use_api_version_3
    end

    # rubocop:disable Style/ClassVars
    @@instance = BitlyFilterCache.new

    def self.instance
      @@instance
    end

    def shorten(input)
      input.strip!
      return input unless @username
      return @result_cache[input] if @result_cache.key?(input)
      bitly = Bitly.new(@username, @key)
      u = bitly.shorten(input, history: 1)
      @result_cache[input] = u.short_url
      u.short_url
    end
  end

  module BitlyFilter
    def bitly(input)
      BitlyFilterCache.instance.shorten(input)
    end
  end
end

Liquid::Template.register_filter(Jekyll::BitlyFilter)
