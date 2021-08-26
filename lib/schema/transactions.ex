defmodule Ameritrade.Transaction do
@moduledoc false
  defstruct type: nil,
            clearingReferenceNumber: nil,
            subAccount: nil,
            settlementDate: nil,
            orderId: nil,
            sma: 0,
            requirementReallocationAmount: 0,
            dayTradeBuyingPowerEffect: 0,
            netAmount: 0,
            transactionDate: nil,
            orderDate: nil,
            transactionSubType: nil,
            transactionId: 0,
            cashBalanceEffectFlag: false,
            description: nil,
            achStatus: nil,
            accruedInterest: 0,
            fees: nil,
            transactionItem: []
end

defmodule Ameritrade.Transaction.Item do
@moduledoc false
  defstruct accountId: 0,
            amount: 0,
            price: 0,
            cost: 0,
            parentOrderKey: 0,
            parentChildIndicator: nil,
            instruction: nil,
            positionEffect: nil,
            instrument: nil
end

defmodule Ameritrade.Transaction.Item.Instrument do
@moduledoc false
  defstruct symbol: nil,
            underlyingSymbol: nil,
            optionExpirationDate: nil,
            optionStrikePrice: 0,
            putCall: nil,
            cusip: nil,
            description: nil,
            assetType: nil,
            bondMaturityDate: nil,
            bondInterestRate: 0
end
