# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :slive,
  ecto_repos: [Slive.Repo]

# Configures the endpoint
config :slive, SliveWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "DD1bFF/gwQtp3bQ5257RNpXOmkPPcpfN6tB8fX/2wuh6RXSPh+gkufow0Ixknm/o",
  render_errors: [view: SliveWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Slive.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# %% Coherence Configuration %%   Don't remove this line
config :coherence,
  user_schema: Slive.User,
  repo: Slive.Repo,
  module: Slive,
  web_module: SliveWeb,
  router: SliveWeb.Router,
  messages_backend: SliveWeb.Coherence.Messages,
  logged_out_url: "/",
  opts: [:authenticatable, :recoverable, :lockable, :trackable, :unlockable_with_token, :invitable, :registerable]
# %% End Coherence Configuration %%
