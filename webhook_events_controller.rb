# controller
class Api::V1::WebhookEventsController < Api::BaseController
  skip_before_action :authenticate_api_request

  def create
    @parser = webhook_parser.new(request, payment_gateway)
    return unless @parser.valid?

    webhook_processor.new(*webhook_processor_params)
    webhook_processor.process
  end

  private

  def payment_gateway
    @payment_gateway ||= PaymentGateway.find_by(name: request.url.split('/').last)
  end

  def webhook_parser
    "Webhooks::#{payment_gateway.class_name}::Parser".classify.constantize
  end

  def webhook_processor
    "Webhooks::#{payment_gateway.class_name}::Processor".classify.constantize
  end

  def webhook_processor_params
    [@parser.attributes, @parser.payment, payment_gateway]
  end
end

