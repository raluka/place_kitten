require 'open-uri'
require 'RMagick'
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  
  def kitten
    image = self.crop
    options = {:disposition => 'inline', :filename => 'cat.jpg', :type => 'image/jpeg'}
    send_data image.to_blob, options
    
  end
  
  def bluring
    image = self.crop
    options = {:disposition => 'inline', :filename => 'cat.jpg', :type => 'image/jpeg'}
    image = image.blur_image(0.0, 1.5)
    send_data image.to_blob, options
    
    
  end
  
  def crop
    data = open('http://animalia-life.com/data_images/cat/cat1.jpg').read
    image = Magick::ImageList.new
    image.from_blob data
    image = image[0].crop_resized(params["width"].to_i, params["height"].to_i)
    image
  end
  
end

