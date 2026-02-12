require 'uri'

module Jekyll
  module RevAssetFilter
    def rev_asset(input)
      return input if ENV['JEKYLL_ENV'] != 'production'

      input_path = Pathname.new(input)
      path = input_path.absolute? ? input_path : Pathname.new(@context.registers[:page]['dir']) + input
      uri = URI.parse("#{@context.registers[:site].config['url']}#{path.to_s}")

      query = uri.query ? CGI.parse(uri.query) : {}
      query['rev'] = ENV['JEKYLL_REV'] || Time.now.to_i
      uri.query = URI.encode_www_form(query)

      return uri.to_s
    end
  end
end

Liquid::Template.register_filter(Jekyll::RevAssetFilter)
