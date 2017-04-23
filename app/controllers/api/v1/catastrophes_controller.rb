module Api
  module V1
    class CatastrophesController < Api::ApiController
      def show
        render json: catastrophe, include: :drone_reports
      end

      def drone_report
        catastrophe.drone_reports << DroneReport.create(drone_report_params)
      end

      private

      def catastrophe
        @catastrophe ||= Catastrophe.find(params[:id])
      end

      def drone_report_params
        params.require(:drone_report).permit(:message)
      end
    end
  end
end
