class School  < ActiveRecord::Base
 has_many :users
 has_many :reports
 acts_as_mappable :lng_column_name => :long

end