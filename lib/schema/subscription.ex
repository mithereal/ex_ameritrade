defmodule Ameritrade.Subscription do
  @moduledoc false
  @derive Jason.Encoder
  defstruct keys: []
end

defmodule Ameritrade.Subscription.Key do
  @moduledoc false
  @derive Jason.Encoder
  defstruct key: nil
end
