AutoHtml.add_filter(:image_link) do |text|
  text.gsub(/http:\/\/.+\.(jpg|jpeg|bmp|gif|png)(\?\S+)?/i) do |match|
    %|<a href="#{match}" rel="facebox"><img src="#{match}" alt="image"/></a>|
  end
end