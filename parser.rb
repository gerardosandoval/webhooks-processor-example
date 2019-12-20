# Parser
module Webhooks
  module PaymentGatwayName
    class Parser
      WEBHOOK_SIGNATURE_ID = 'XXXXXXXXXXXXXXXX'.freeze
      COMMERCE_KEY = "XXXXXXXXXXXXXXXX".freeze

      attr_reader :request

      def initialize(request, payment_gateway)
        @request = request
        @payment_gateway = payment_gateway
      end

      def valid?
        validate_merchant && validate_signature && validate_payment_existance
      end

      def validate_merchant
        request.headers['X-PaymentGatwayName-Key'] == COMMERCE_KEY #PaymentGatwayName ID of the merchant
      end

      def validate_signature
        timestamp = request.headers['X-PaymentGatwayName-Id'] # WebhookId of the request is the date in timestamp format.
        signature = request.headers['X-PaymentGatwayName-SimpleSignature']
        expected_signature = OpenSSL::HMAC.hexdigest("SHA256", WEBHOOK_SIGNATURE_ID, timestamp)
        signature == expected_signature
      end

      def validate_payment_existance; end

      def attributes
        # parse body into attributes to create event
      end
    end
  end
end
