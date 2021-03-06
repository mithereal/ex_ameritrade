defmodule Ameritrade.Quote.Index do
  @moduledoc false
  @derive Jason.Encoder
  defstruct symbol: nil,
            description: nil,
            lastPrice: 0,
            openPrice: 0,
            highPrice: 0,
            lowPrice: 0,
            closePrice: 0,
            netChange: 0,
            totalVolume: 0,
            tradeTimeInLong: 0,
            exchange: nil,
            exchangeName: nil,
            digits: 0,
            fiftyTwoWkHigh: 0,
            fiftyTwoWkLow: 0,
            securityStatus: nil
end

defmodule Ameritrade.Quote.MutualFund do
  @moduledoc false
  @derive Jason.Encoder
  defstruct symbol: nil,
            description: nil,
            closePrice: 0,
            netChange: 0,
            totalVolume: 0,
            tradeTimeInLong: 0,
            exchange: nil,
            exchangeName: nil,
            digits: 0,
            fiftyTwoWkHigh: 0,
            fiftyTwoWkLow: 0,
            nAV: 0,
            peRatio: 0,
            divAmount: 0,
            divYield: 0,
            divDate: nil,
            securityStatus: nil
end

defmodule Ameritrade.Quote.Future do
  @moduledoc false
  @derive Jason.Encoder
  defstruct symbol: nil,
            bidPriceInDouble: 0,
            askPriceInDouble: 0,
            lastPriceInDouble: 0,
            bidId: nil,
            askId: nil,
            highPriceInDouble: 0,
            lowPriceInDouble: 0,
            closePriceInDouble: 0,
            exchange: nil,
            description: nil,
            lastId: nil,
            openPriceInDouble: 0,
            changeInDouble: 0,
            futurePercentChange: 0,
            exchangeName: nil,
            securityStatus: nil,
            openInterest: 0,
            mark: 0,
            tick: 0,
            tickAmount: 0,
            product: nil,
            futurePriceFormat: nil,
            futureTradingHours: nil,
            futureIsTradable: false,
            futureMultiplier: 0,
            futureIsActive: false,
            futureSettlementPrice: 0,
            futureActiveSymbol: nil,
            futureExpirationDate: nil
end

defmodule Ameritrade.Quote.FutureOptions do
  @moduledoc false
  @derive Jason.Encoder
  defstruct symbol: nil,
            bidPriceInDouble: 0,
            askPriceInDouble: 0,
            lastPriceInDouble: 0,
            highPriceInDouble: 0,
            lowPriceInDouble: 0,
            closePriceInDouble: 0,
            description: nil,
            openPriceInDouble: 0,
            netChangeInDouble: 0,
            openInterest: 0,
            exchangeName: nil,
            securityStatus: nil,
            volatility: 0,
            moneyIntrinsicValueInDouble: 0,
            multiplierInDouble: 0,
            digits: 0,
            strikePriceInDouble: 0,
            contractType: nil,
            underlying: nil,
            timeValueInDouble: 0,
            deltaInDouble: 0,
            gammaInDouble: 0,
            thetaInDouble: 0,
            vegaInDouble: 0,
            rhoInDouble: 0,
            mark: 0,
            tick: 0,
            tickAmount: 0,
            futureIsTradable: false,
            futureTradingHours: nil,
            futurePercentChange: 0,
            futureIsActive: false,
            futureExpirationDate: 0,
            expirationType: nil,
            exerciseType: nil,
            inTheMoney: false
end

defmodule Ameritrade.Quote.Option do
  @moduledoc false
  @derive Jason.Encoder
  defstruct symbol: nil,
            description: nil,
            bidPrice: 0,
            bidSize: 0,
            askPrice: 0,
            askSize: 0,
            lastPrice: 0,
            lastSize: 0,
            openPrice: 0,
            highPrice: 0,
            lowPrice: 0,
            closePrice: 0,
            netChange: 0,
            totalVolume: 0,
            quoteTimeInLong: 0,
            tradeTimeInLong: 0,
            mark: 0,
            openInterest: 0,
            volatility: 0,
            moneyIntrinsicValue: 0,
            multiplier: 0,
            strikePrice: 0,
            contractType: nil,
            underlying: nil,
            timeValue: 0,
            deliverables: nil,
            delta: 0,
            gamma: 0,
            theta: 0,
            vega: 0,
            rho: 0,
            securityStatus: nil,
            theoreticalOptionValue: 0,
            underlyingPrice: 0,
            uvExpirationType: nil,
            exchange: nil,
            exchangeName: nil,
            settlementType: nil
end

defmodule Ameritrade.Quote.Forex do
  @moduledoc false
  @derive Jason.Encoder
  defstruct symbol: nil,
            bidPriceInDouble: 0,
            askPriceInDouble: 0,
            lastPriceInDouble: 0,
            highPriceInDouble: 0,
            lowPriceInDouble: 0,
            closePriceInDouble: 0,
            exchange: nil,
            description: nil,
            openPriceInDouble: 0,
            changeInDouble: 0,
            percentChange: 0,
            exchangeName: nil,
            digits: 0,
            securityStatus: nil,
            tick: 0,
            tickAmount: 0,
            product: nil,
            tradingHours: nil,
            isTradable: false,
            marketMaker: nil,
            fiftyTwoWkHighInDouble: 0,
            fiftyTwoWkLowInDouble: 0,
            mark: 0
end

defmodule Ameritrade.Quote.ETF do
  @moduledoc false
  @derive Jason.Encoder
  defstruct symbol: nil,
            description: nil,
            bidPrice: 0,
            bidSize: 0,
            bidId: nil,
            askPrice: 0,
            askSize: 0,
            askId: nil,
            lastPrice: 0,
            lastSize: 0,
            lastId: nil,
            openPrice: 0,
            highPrice: 0,
            lowPrice: 0,
            closePrice: 0,
            netChange: 0,
            totalVolume: 0,
            quoteTimeInLong: 0,
            tradeTimeInLong: 0,
            mark: 0,
            exchange: nil,
            exchangeName: nil,
            marginable: false,
            shortable: false,
            volatility: 0,
            digits: 0,
            fiftyTwoWkHigh: 0,
            fiftyTwoWkLow: 0,
            peRatio: 0,
            divAmount: 0,
            divYield: 0,
            divDate: nil,
            securityStatus: nil,
            regularMarketLastPrice: 0,
            regularMarketLastSize: 0,
            regularMarketNetChange: 0,
            regularMarketTradeTimeInLong: 0
end

defmodule Ameritrade.Quote.Equity do
  @moduledoc false
  @derive Jason.Encoder
  defstruct symbol: nil,
            description: nil,
            bidPrice: 0,
            bidSize: 0,
            bidId: nil,
            askPrice: 0,
            askSize: 0,
            askId: nil,
            lastPrice: 0,
            lastSize: 0,
            lastId: nil,
            openPrice: 0,
            highPrice: 0,
            lowPrice: 0,
            closePrice: 0,
            netChange: 0,
            totalVolume: 0,
            quoteTimeInLong: 0,
            tradeTimeInLong: 0,
            mark: 0,
            exchange: nil,
            exchangeName: nil,
            marginable: false,
            shortable: false,
            volatility: 0,
            digits: 0,
            fiftyTwoWkHigh: 0,
            fiftyTwoWkLow: 0,
            peRatio: 0,
            divAmount: 0,
            divYield: 0,
            divDate: nil,
            securityStatus: nil,
            regularMarketLastPrice: 0,
            regularMarketLastSize: 0,
            regularMarketNetChange: 0,
            regularMarketTradeTimeInLong: 0
end
