# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :ocean_ship_logbooks,
  ecto_repos: [OceanShipLogbooks.Repo]

config :ocean_ship_logbooks, OceanShipLogbooks.Repo,
  types: OceanShipLogbooks.PostgrexTypes

# Configures the endpoint
config :ocean_ship_logbooks, OceanShipLogbooks.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "5bPqkKv1eTQctPAa0Lu8ga2frswfgTKeF7vrw28rhQYdI3JbyAT6eBvuLDNnoJKU",
  render_errors: [view: OceanShipLogbooks.ErrorView, accepts: ~w(html json)],
  pubsub: [name: OceanShipLogbooks.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
