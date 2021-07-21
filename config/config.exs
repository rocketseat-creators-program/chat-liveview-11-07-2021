# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :ec_messege, :pow,
  ecto_repos: [EcMessege.Repo]

# Configures the endpoint
config :ec_messege, EcMessegeWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "1DIfBo60I3JK7ag8GLxPV3fQfImnZxGJl6b9l4DlT715VoQMjbbUJlBrO87meHpO",
  render_errors: [view: EcMessegeWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: EcMessege.PubSub,
  live_view: [signing_salt: "CNOxp3Ge"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :ec_messege, :pow,
 user: EcMessege.Auth.User,
 repo: EcMessege.Repo,
 web_module: EcMessegeWeb

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
