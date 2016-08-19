module ApplicationHelper

  def plural_nest objectos, groupus
    link_to pluralize(objectos.send(groupus.pluralize).count, groupus), send("#{objectos.class.name.downcase}_#{groupus.pluralize}_path", objectos)
  end
  
  def simple_list_of parent, children
    content_tag_for(:header, parent, children) do
      "~#{children}~"
    end +
    div_for(parent, "#{children}_in") do
      parent.send(children).map do |child|
        div_for(child) do
          link_to(child.name, child)
        end
      end.join.html_safe
    end
  end

  def google_analytics
    "<script>
      (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
      })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

      ga('create', '#{ENV['GOOGLE_ANALYTICS_CODE']}', 'auto');
      ga('send', 'pageview');
    </script>".html_safe
  end

end
