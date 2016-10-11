module TraditionsHelper
  def navigation_in_cards
    content_tag(:div, :id => 'getting_around') do
      content_tag(:div, :id => 'this_is_the_way') do
        'You may find these pathways useful'
      end +
      content_tag(:nav, :id => 'magician_navigation') do
        navigation_to_resource('traditions') +
        navigation_to_resource('decks') +
        navigation_to_resource('suits') +
        navigation_to_resource('cards') +
        navigation_to_resource('interpretations') +
        navigation_to_resource('spreads') +
        navigation_to_resource('positions') +
        navigation_to_resource('readers') +
        navigation_to_resource('events') +
        navigation_to_resource('readings') +
        navigation_to_resource('positions') +
        navigation_to_resource('appearances') +
        navigation_to_resource('lines') +
        navigation_to_resource('places')
      end
    end
  end
  
  def navigation_for_reader
    content_tag(:div, :id => 'getting_around') do
      content_tag(:div, :id => 'this_is_the_way') do
        'You may find these pathways useful'
      end +
      content_tag(:nav, :id => 'magician_navigation') do
        navigation_to_resource('decks') +
        navigation_to_resource('spreads') +
        navigation_to_resource('events') +
        navigation_to_resource('readings') +
        navigation_to_resource('interpretations')
      end
    end
  end
  
  def navigation_for_querent
    content_tag(:div, :id => 'getting_around') do
      content_tag(:div, :id => 'this_is_the_way') do
        'You may find these pathways useful'
      end +
      content_tag(:nav, :id => 'magician_navigation') do
        link_to('lines for readings', Event.last) + ' ' +
        link_to('my readings', querent_readings_path(current_querent))
      end
    end
  end
  
  def navigation_to_resource canopy
    content_tag :li, :id => canopy do
      link_to canopy, send("#{canopy}_path")
    end
  end
end
