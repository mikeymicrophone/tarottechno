module CriticalPath
  def select_with_criteria choices, *metaphors
    criteria = metaphors.map do |metaphor|
      if choices["#{metaphor}_id"]
        ["regarding_#{metaphor}", choices["#{metaphor}_id"]]
      end
    end.compact
    case criteria.length
    when 0
      all
    when 1
      send *criteria.first
    end
  end
end
