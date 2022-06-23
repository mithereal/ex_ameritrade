defmodule Ameritrade.Response do
  @moduledoc false

  @derive Jason.Encoder
  defstruct [
    :service,
    :requestid,
    :timestamp,
    :command,
    :content
  ]
end
