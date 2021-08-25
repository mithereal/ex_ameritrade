defmodule Ameritrade.Activity do
  defmodule Execution do
    defstruct activityType: nil,
              executionType: nil,
              quantity: 0,
              orderRemainingQuantity: 0,
              executionLegs: nil
  end

  defmodule Execution.Legs do
    defstruct legId: 0,
              quantity: 0,
              mismarkedQuantity: 0,
              price: 0,
              time: nil
  end
end
