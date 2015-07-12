json.schools @close_schools do |school|
  json.school_name school.name
  json.reports school.reports do |report|
    json.report_title report.title
    json.report_description report.description
    json.report_lat report.lat
    json.report_long report.long
    json.timestamp report.created_at
    json.type report.types do |type|
      json.type_title type.title
    end
  end
end
