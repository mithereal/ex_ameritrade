defmodule Ameritrade.Request do
  @moduledoc false

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
