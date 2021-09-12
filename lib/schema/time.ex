defmodule Ameritrade.Time do
  @moduledoc false
  @derive Jason.Encoder
  defstruct date: nil,
            shortFormat: false
end
