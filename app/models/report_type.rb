class ReportType < ActiveRecord::Base
  belongs_to :report
  belongs_to :type

end
