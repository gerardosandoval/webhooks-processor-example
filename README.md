This is just an example of how multiple service Webhooks can be processed using a webhook_parser and a webhook_processor.

Webhooks responses should be saved in the database (WebhookEvent), in order for the project to process them in the background if needed.

This files are not intended to run properly just by the sole purpose of adding them to your project. They are a kind of guide for myself to implement webhook services.
