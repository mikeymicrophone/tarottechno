module TraditionsHelper
  def navigation_in_cards
    content_tag(:div, :id => 'getting_around') do
      content_tag(:div, :id => 'this_is_the_way') do
        'You may find these pathways useful in your work...'
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
        navigation_to_resource('appearances')
      end
    end
  end
  
  def navigation_to_resource canopy
    content_tag :li, :id => canopy do
      link_to canopy, send("#{canopy}_path")
    end
  end
end
