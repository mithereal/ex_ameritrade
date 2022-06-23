defmodule Ameritrade.Account do
  @moduledoc false

  @derive Jason.Encoder
  defstruct securitiesAccount: nil
end

defmodule Ameritrade.Account.Cash do
  @moduledoc false
  @derive Jason.Encoder
  defstruct type: nil,
            accountId: nil,
            roundTrips: 0,
            isDayTrader: nil,
            isClosingOnlyRestricted: nil,
            positions: [],
            orderStrategies: [],
            activationPrice: 0,
            specialInstruction: nil,
            orderStrategyType: nil,
            orderId: 0,
            cancelable: false,
            editable: false,
            status: nil,
            enteredTime: nil,
            closeTime: nil,
            tag: nil,
            orderActivityCollection: [],
            replacingOrderCollection: [],
            childOrderStrategies: [],
            statusDescription: nil,
            initialBalances: [],
            currentBalances: [],
            projectedBalances: []
end

defmodule Ameritrade.Account.Margin do
  @moduledoc false
  @derive Jason.Encoder
  defstruct type: nil,
            accountId: nil,
            roundTrips: 0,
            isDayTrader: false,
            isClosingOnlyRestricted: false,
            positions: [],
            orderStrategies: [],
            initialBalances: nil,
            currentBalances: nil,
            projectedBalances: nil
end
