module ApplicationHelper

  def plural_nest objectos, groupus
    link_to pluralize(objectos.send(groupus.pluralize).count, groupus), send("#{objectos.class.name.downcase}_#{groupus.pluralize}_path", objectos)
  end
  
  def simple_list_of parent, children, description = :name
    content_tag_for(:header, parent, children) do
      "~#{children}~"
    end +
    div_for(parent, "#{children}_in") do
      parent.send(children).map do |child|
        div_for(child) do
          link_to(child.send(description), child)
        end
      end.join.html_safe
    end
  end
  
  def markdowner
    @renderer ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  end
  
  def facebook_initializer
    "<div id='fb-root'></div>
    <script>
      window.fbAsyncInit = function() {
        FB.init({
          appId      : '#{ENV['FACEBOOK_APP_ID']}',
          xfbml      : true,
          version    : 'v2.7'
        });
      };

      (function(d, s, id){
         var js, fjs = d.getElementsByTagName(s)[0];
         if (d.getElementById(id)) {return;}
         js = d.createElement(s); js.id = id;
         js.src = '//connect.facebook.net/en_US/sdk.js';
         fjs.parentNode.insertBefore(js, fjs);
       }(document, 'script', 'facebook-jssdk'));
    </script>".html_safe
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
