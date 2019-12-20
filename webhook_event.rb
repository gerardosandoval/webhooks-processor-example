# model
class WebhookEvent < ApplicationRecord
  belongs_to :payment_gateway
  belongs_to :payment
end