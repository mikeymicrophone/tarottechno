Fabricator(:line) do
  reader { Reader.random }
  event { Event.random }
end
