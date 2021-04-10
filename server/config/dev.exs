use Mix.Config

# username =
#   System.get_env("USERNAME") ||
#     raise """
#     environment variable USERNAME is missing.
#     You can generate one by calling: mix phx.gen.secret
#     """

# password =
#   System.get_env("PASSWORD") ||
#     raise """
#     environment variable PASSWORD is missing.
#     You can generate one by calling: mix phx.gen.secret
#     """

# database_postgres =
#   System.get_env("DATABASE_POSTGRES") ||
#     raise """
#     environment variable DATABASE_POSTGRES is missing.
#     You can generate one by calling: mix phx.gen.secret
#     """

# hostname_postgres =
#   System.get_env("HOSTNAME_POSTGRES") ||
#     raise """
#     environment variable HOSTNAME_POSTGRES is missing.
#     You can generate one by calling: mix phx.gen.secret
#     """

# Configure your database
config :events_app, CompanyTest.Repo,
username: "blazeneu",
password: "atlan99",
database: "events_app_dev",
hostname: "localhost",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with webpack to recompile .js and .css sources.
config :events_app, CompanyTestWeb.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: []

config :cors_plug,
  origin: ["http://localhost:3000"],
  max_age: 86400,
  methods: ["GET", "POST", "PATCH", "DELETE"],
  headers: ["x-auth", "Content-Type"]

# ## SSL Support
#
# In order to use HTTPS in development, a self-signed
# certificate can be generated by running the following
# Mix task:
#
#     mix phx.gen.cert
#
# Note that this task requires Erlang/OTP 20 or later.
# Run `mix help phx.gen.cert` for more information.
#
# The `http:` config above can be replaced with:
#
#     https: [
#       port: 4001,
#       cipher_suite: :strong,
#       keyfile: "priv/cert/selfsigned_key.pem",
#       certfile: "priv/cert/selfsigned.pem"
#     ],
#
# If desired, both `http:` and `https:` keys can be
# configured to run both http and https servers on
# different ports.

# Watch static and templates for browser reloading.
config :events_app, CompanyTestWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r"priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"priv/gettext/.*(po)$",
      ~r"lib/events_app_web/(live|views)/.*(ex)$",
      ~r"lib/events_app_web/templates/.*(eex)$"
    ]
  ]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Initialize plugs at runtime for faster development compilation
config :phoenix, :plug_init_mode, :runtime
