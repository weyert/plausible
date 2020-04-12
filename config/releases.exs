import Config
# use Mix.Config

secret_key_base = System.fetch_env!("SECRET_KEY_BASE")
database_url = System.fetch_env!("AVIEN_DATABASE_URL")
pool_size = System.fetch_env!("POOL_SIZE")
app_port = System.fetch_env!("PORT")
google_client_id = System.fetch_env!("GOOGLE_CLIENT_ID")
google_client_secret = System.fetch_env!("GOOGLE_CLIENT_SECRET")
webhook = System.fetch_env!("SLACK_WEBHOOK")
postmark_api_key = System.fetch_env!("POSTMARK_API_KEY")
twitter_consumer_secret = System.fetch_env!("TWITTER_CONSUMER_SECRET")
twitter_consumer_key = System.fetch_env!("TWITTER_CONSUMER_KEY")
twitter_token = System.fetch_env!("TWITTER_ACCESS_TOKEN")
twitter_token_secret = System.fetch_env!("TWITTER_ACCESS_TOKEN_SECRET")

# For production, don't forget to configure the url host
# to something meaningful, Phoenix uses this information
# when generating URLs.
#
# Note we also include the path to a cache manifest
# containing the digested version of static files. This
# manifest is generated by the `mix phx.digest` task,
# which you should run after static files are built and
# before starting your production server.
config :plausible, PlausibleWeb.Endpoint,
  http: [:inet6, port: System.fetch_env("PORT") || 4000],
  url: [host: System.fetch_env("HOST"), scheme: "https", port: 443],
  cache_static_manifest: "priv/static/cache_manifest.json"

# Do not print debug messages in production
config :logger, level: :info

# Finally import the config/prod.secret.exs which should be versioned
# separately.
config :plausible, PlausibleWeb.Endpoint,
  secret_key_base: secret_key_base

# Configure your database
config :plausible, Plausible.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: database_url,
  pool_size: 10,
  timeout: 10_000,
  ssl: true

config :plausible, :google,
  client_id: google_client_id,
  client_secret: google_client_secret

config :plausible, :slack,
 webhook: webhook

config :plausible, Plausible.Mailer,
  adapter: Bamboo.PostmarkAdapter,
  api_key: postmark_api_key

config :plausible, :twitter, [
   consumer_key: twitter_consumer_secret,
   consumer_secret: twitter_consumer_key,
   token: twitter_token,
   token_secret: twitter_token_secret
]
