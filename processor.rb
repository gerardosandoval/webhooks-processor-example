

# processor
module Webhooks
  module PaymentGatwayName
    class Processor

      def initialize(event_attrs, payment, payment_gateway)
        @event_attrs = event_attrs
        @payment = payment
        @payment_gateway = payment_gateway
      end

      def process
        save_webhook
        # process event
      end

      private

      def save_webhook
        webhook_event = WebhookEvent.new(@event_attrs)
        webhook_event.payment_gateway = @payment_gateway
        webhook_event.payment = @payment
        webhook_event.save
      end
    end
  end 
end
