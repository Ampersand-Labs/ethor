module EthorApi
  module Api
    class Ticket < Base
      

      # params[:order_type] - required ['pickup' or 'delivery' or 'dine_in' or 'carry_out']: The order type,
      def create store_id, params
        @client.post("/stores/#{store_id}/tickets", params).body
      end

    end
  end
end
