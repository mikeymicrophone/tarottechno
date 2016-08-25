module LinesHelper
  def enterable_line line
    div_for line, :at_reading do
      "#{line.reader.name} has #{pluralize(line.places.unfinished.count, 'querent')} in #{current_reader == line.reader ? link_to('line', line) : 'line'} #{current_querent ? (current_querent.is_not_in_line(line) ? link_to('get in line', places_path(:place => {:line_id => line.id}), :method => :post, :remote => true, :id => dom_id(line, :entrance_link_for)).html_safe : '(you are ' + current_querent.place_in_line(line).ordinalize + ')<br>' + link_to('click here to write the details as or after they happen', new_reading_path(:reading => {:reader_id => line.reader_id, :querent_id => current_querent&.id, :event_id => line.event_id}))) : ''}".html_safe
    end
  end  
end
