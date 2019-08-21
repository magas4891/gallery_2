class ParserController < ApplicationController

  def grab
    @image.save!
  end

  private
  def parser_params
    params.require(:parser).permit(:site)
  end
end
