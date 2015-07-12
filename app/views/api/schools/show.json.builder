json.school do
  json.id    school.id
  json.name school.name
  json.street_name school.street_name
  json.street_number school.street_number
  json.city school.city
  json.state school.state
  json.zip_code school.zip_code
  json.lat school.lat
  json.long school.long
  json.created_at schools.created_at

  json.report_id school.report ? school.report.id : nil
end
