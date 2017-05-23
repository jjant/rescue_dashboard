require "uri"
require "net/http"

module Api
  module V1
    class CatastrophesController < Api::ApiController
      def show
        render json: catastrophe, include: :drone_reports
      end

      def drone_report
        catastrophe.drone_reports << DroneReport.create(drone_report_params)
      end

      # TODO: completar el find bien
      def drone_report_rama
        Catastrophe.find_by(name: 'algo con comodoro').drone_reports << DroneReport.create(drone_report_rama_params)
      end

      def delete_drone_report
        DroneReport.delete(params[:report_id])
      end

      def simulation
        simulation_catastrophe.drone_reports = []
        sleep 5
        sleep 1
        DroneReport.create(message: 'Posible inundación. Dirección aproximada: Avenida Canada y El patagonico. Latitud: -45.8743417, longitud: -67.5216458', image_url: "/images/fire/4.jpg", catastrophe: simulation_catastrophe)
        sleep 1
        DroneReport.create(message: 'Posible inundación. Dirección aproximada: Maipú y Francia . Latitud: -45.662173, longitud: -67.4379824', image_url: "/images/comodoro/24.jpg", catastrophe: simulation_catastrophe)
        sleep 4.5
        DroneReport.create(message: 'Posible incendio. Dirección aproximada: Saavedra y Ameghino. Latitud: -45.8691692, longitud: -67.4889879', image_url: "/images/comodoro/13.jpg", catastrophe: simulation_catastrophe)
        sleep 4
        DroneReport.create(message: 'Posible inundación. Dirección aproximada: Viamonte y Aristóbulo del Valle. Latitud: -45.8749621, longitud: -67.5065844', image_url: "/images/comodoro/3.jpg", catastrophe: simulation_catastrophe)
        sleep 3.5
        DroneReport.create(message: 'Posible persona atrapada. Dirección aproximada: Huergo y Urquiza. Latitud: -45.8632373, longitud: -67.4856834', image_url: "/images/comodoro/5.jpg", catastrophe: simulation_catastrophe)
      end

      private

      def simulation_catastrophe
        Catastrophe.find_by(name: 'Inundanción de Comodoro Rivadavia')
      end

      def catastrophe
        @catastrophe ||= Catastrophe.find(params[:id])
      end

      def drone_report_params
        params.require(:drone_report).permit(:message)
      end

      # TODO: RAMA, QUE ME VAS A MANDAR?
      # id de la catastrofe
      def drone_report_rama_params
        params.permit(:drone_id, :lat, :lng, :type, :message, :image_url)
      end

      def send_request_to_analyze
        params = {'box1' => 'Nothing is less important than which fork you use. Etiquette is the science of living. It embraces everything. It is ethics. It is honor. -Emily Post',
        'button1' => 'Submit'
        }
        x = Net::HTTP.post_form(URI.parse('http://www.interlacken.com/webdbdev/ch05/formpost.asp'), params)
        puts x.body

      end
    end
  end
end
