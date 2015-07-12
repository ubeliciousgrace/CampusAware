module Api
  class ReportsController < Api::BaseController

    private

      def report_params
        params.require().permit(:description)
      end

      def query_params
        # this assumes that a report belongs to a user and has an :user_id
        # allowing us to filter by this
        params.permit()
      end

  end
end