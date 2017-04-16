# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :loca_web,
  namespace: Loca.Web,
  ecto_repos: [Loca.Repo]

# Configures the endpoint
config :loca_web, Loca.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "OzyPAHlZB5pGymMoEvSA4t8zUpnYI1w1aclWpvCMj3YjbJYzVhSdaOmjBHTBM88p",
  render_errors: [view: Loca.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Loca.Web.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
