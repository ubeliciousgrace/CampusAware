class Type < ActiveRecord::Base
  has_many :report_types
  has_many :reports, through: :report_types

end