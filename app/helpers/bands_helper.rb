module BandsHelper
  def link_to_band(id, name)
    link_to name, 
       :controller => "bands",
       :action => "show",
       :id => id
  end
  
  def s3_image_link(file)
    image_tag('http://slbimages.s3-website-us-east-1.amazonaws.com/' + file)  
  end
end
