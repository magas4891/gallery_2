class ParserController < ApplicationController
  def new
  end
  def create
    # require 'nokogiri'
    # require 'httparty'
    # require 'byebug'
    # require 'json'

    # @site =

    url = 'http://fit4brain.com/'
    unparsed_page = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(unparsed_page)
    parsed_images = Array.new
    images = parsed_page.css('img')
    images.each do |image|
      img = {
          # title: image.attributes['title'],
          url: image.attributes['src'].value
      }
      parsed_images << img
    end
      # puts JSON.pretty_generate(parsed_images)

  end

  private
  def parser_params
    params.require(:parser).permit(:site)
  end
end
