class Report < ActiveRecord::Base
 belongs_to :user
 belongs_to :school
 has_many :report_types
 has_many :types, through: :report_types

 def address=(address)
  @address = address
 end 

 def address
  @address
end

 def convert_to_latlng
   concat_address = self.street_number.to_s + " " + self.street_name + " " + self.city + " " + self.state + " " + self.zip_code.to_s
   coords = Geocoder.search(concat_address)
   location_data = coords[0]
   location_data.geometry["location"]
end

end