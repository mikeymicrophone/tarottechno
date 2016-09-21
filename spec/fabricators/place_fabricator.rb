Fabricator(:place) do
  line { Line.random }
  querent { Querent.random }
end
