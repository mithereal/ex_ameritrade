import Config

config :ameritrade,
  client_id: "client_id"

import_config "#{config_env()}.exs"
