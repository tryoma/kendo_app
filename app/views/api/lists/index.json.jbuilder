json.set! :lists do
  json.array! @lists do |list|
    json.extract! list, :id, :title, :is_done, :is_done
  end
end
