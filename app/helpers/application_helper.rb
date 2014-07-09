module ApplicationHelper
	def photo_icon(title,photo_id)
		get_img_info = flickr.photos.getInfo(:photo_id => photo_id)
		img_url = FlickRaw.url_b(get_img_info) 
    link_to image_tag(img_url, :alt => title, :title => title, :height => "100", :width => "100"), img_url, :rel => "prettyPhoto[pp_gal]"
  end
  
  def larrow_link_to(str, path, opts={})
    link_to "&larr; ".html_safe + str, path, opts
  end

  def page_title(title)
    content_for :page_title do
      title
    end
  end

  def body_class(body_klazz)
    content_for :body_class do
      body_klazz
    end
  end
	def clfix
    "<div class=\"cl\">&nbsp;</div>".html_safe
  end

end