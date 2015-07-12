module Api
  class SchoolsController < Api::BaseController

    private

      def school_params
        params.require(:school).permit(:name)
      end

      def query_params
        # this assumes that a campus belongs to an user and has an :campus_id
        # allowing us to filter by this
        # go through all the reports and print out
        params.permit(:report_id, :type)
      end

  end
end