ActiveAdmin.register_page 'Parser' do
  page_action :grab, method: :post do
    # url = 'http://fit4brain.com/'
    unparsed_page = HTTParty.get(params[:parser][:url])
    parsed_page = Nokogiri::HTML(unparsed_page)
    # parsed_images = Array.new
    @images = parsed_page.css('img')
    @images.each do |image|
      img = {
          # title: image.attributes['title'],
          url: image.attributes['src'].value
      }
    end
    render partial: 'images', image: @images
  end

  content do
    render partial: 'form'
  end

end
