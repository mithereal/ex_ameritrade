defmodule Ameritrade.Option do
  defstruct putCall: nil,
            symbol: nil,
            description: nil,
            exchangeName: nil,
            bidPrice: 0,
            askPrice: 0,
            lastPrice: 0,
            markPrice: 0,
            bidSize: 0,
            askSize: 0,
            lastSize: 0,
            highPrice: 0,
            lowPrice: 0,
            openPrice: 0,
            closePrice: 0,
            totalVolume: 0,
            quoteTimeInLong: 0,
            tradeTimeInLong: 0,
            netChange: 0,
            volatility: 0,
            delta: 0,
            gamma: 0,
            theta: 0,
            vega: 0,
            rho: 0,
            timeValue: 0,
            openInterest: 0,
            isInTheMoney: false,
            theoreticalOptionValue: 0,
            theoreticalVolatility: 0,
            isMini: false,
            isNonStandard: false,
            optionDeliverablesList: [],
            strikePrice: 0,
            expirationDate: nil,
            expirationType: nil,
            multiplier: 0,
            settlementType: nil,
            deliverableNote: nil,
            isIndexOption: false,
            percentChange: 0,
            markChange: 0,
            markPercentChange: 0
            end

  defmodule Ameritrade.Option.Chain do
    defstruct symbol: nil,
              status: nil,
              underlying: nil,
              strategy: nil,
              interval: 0,
              isDelayed: false,
              isIndex: false,
              daysToExpiration: 0,
              interestRate: 0,
              underlyingPrice: 0,
              volatility: 0,
              callExpDateMap: nil,
              putExpDateMap: nil
  end

  defmodule Ameritrade.Option.Underlying do
    defstruct ask: 0,
              askSize: 0,
              bid: 0,
              bidSize: 0,
              change: 0,
              close: 0,
              delayed: false,
              description: nil,
              exchangeName: nil,
              fiftyTwoWeekHigh: 0,
              fiftyTwoWeekLow: 0,
              highPrice: 0,
              last: 0,
              lowPrice: 0,
              mark: 0,
              markChange: 0,
              markPercentChange: 0,
              openPrice: 0,
              percentChange: 0,
              quoteTime: 0,
              symbol: nil,
              totalVolume: 0,
              tradeTime: 0
  end

  defmodule Ameritrade.Option.Deliverables do
    defstruct symbol: nil,
              assetType: nil,
              deliverableUnits: nil,
              currencyType: nil
  end

  defmodule Ameritrade.Option.Experation.Date do
    defstruct date: nil
  end

