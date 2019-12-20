# migration
class CreateWebhookEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :webhook_events do |t|
      t.references :payment_gateway, foreign_key: true
      t.references :payment, foreign_key: true
      t.string :name
      t.float :amount
      t.string :status
      t.string :transaction_code
      t.string :reference
      t.string :currency_code
      t.string :card_last_numbers
      t.string :authorization_code
      t.jsonb :raw_data
      t.datetime :timestamp

      t.timestamps
    end
  end
end