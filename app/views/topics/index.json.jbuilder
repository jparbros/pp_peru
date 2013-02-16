json.array!(@tree) do |label|
  json.id label[:id]
  json.label link_to label[:label], index_by_controller(@controller_t, topic_id: label[:id])
	json.children do
		json.array!(label[:children]) do |children|
			json.id children[:id]
			json.label  link_to children[:label],index_by_controller(@controller_t, topic_id: children[:id])
		end
	end
end