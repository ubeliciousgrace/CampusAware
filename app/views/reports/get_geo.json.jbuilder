json.schools @close_schools do |school|
  json.school_name school.name
  json.reports school.reports do |report|
    json.report_title report.title
    json.report_description report.description
    json.report_lat report.lat
    json.report_lat report.long
  end
end
