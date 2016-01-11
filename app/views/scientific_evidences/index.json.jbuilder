json.array!(@scientific_evidences) do |scientific_evidence|
  json.extract! scientific_evidence, :id, :ailment_id, :description, :link, :featured, :comment
  json.url scientific_evidence_url(scientific_evidence, format: :json)
end
