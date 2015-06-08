module LinksHelper
  def format_link(url)
    (url.include?('//') ? '' : '//') + url
  end
end
