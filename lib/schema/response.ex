defmodule Ameritrade.Response do
  @derive Jason.Encoder
  defstruct [
    :service,
    :requestid,
    :timestamp,
    :command,
    :content
  ]
end
