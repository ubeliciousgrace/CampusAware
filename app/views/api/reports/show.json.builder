json.reports @reports do
  json.id   report.id
  json.type report.type
  json.description report.description
  json.street_number report.street_number
  json.street_name report.street_name
  json.city report.city
  json.state report.state
  json.zip_code report.zip_code
  json.created_at report.created_at

end