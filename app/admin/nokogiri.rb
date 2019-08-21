ActiveAdmin.register_page 'Parser' do
  page_action :grab, method: :post do
    unparsed_page = HTTParty.get(params[:parser][:url])
    parsed_page = Nokogiri::HTML(unparsed_page)
    @images = parsed_page.css('img')
    @images.each do |image|
      img = {
          url: image.attributes['src'].value
      }
    end
    render partial: 'images', image: @images
  end

  content do
    render partial: 'form'
  end

  page_action :parser_save, method: :post do
    @image.save!
  end

end
