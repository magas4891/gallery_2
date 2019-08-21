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
    @categoty = Category.find(13)
    @user = User.find(11)
    @url = params[:remote_picture_url]
    @image = Image.new
    @image.title = "NoName"
    @image.category = @categoty
    @image.user = @user
    @image.remote_picture_url = @url
    @image.save!


  end

end
