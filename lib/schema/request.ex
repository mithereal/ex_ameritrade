defmodule Ameritrade.Request do
  @derive Jason.Encoder
defstruct [
  :service,
  :requestid,
  :command,
  :account,
  :source,
  :parameters
]
end