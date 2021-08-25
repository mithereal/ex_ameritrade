defmodule Ameritrade.Instrument do
  defmodule Equity do
    defstruct assetType: nil,
              cusip: nil,
              symbol: nil,
              description: nil
  end

  defmodule FixedIncome do
    defstruct assetType: nil,
              cusip: nil,
              symbol: nil,
              description: nil,
              maturityDate: nil,
              variableRate: 0,
              factor: 0
  end

  defmodule MutualFund do
    defstruct assetType: nil,
              cusip: nil,
              symbol: nil,
              description: nil,
              type: nil
  end

  defmodule CashEquivalent do
    defstruct assetType: nil,
              cusip: nil,
              symbol: nil,
              description: nil,
              type: nil
  end

  defmodule Option do
    defstruct assetType: nil,
              cusip: nil,
              symbol: nil,
              description: nil,
              type: nil,
              putCall: nil,
              underlyingSymbol: nil,
              optionMultiplier: 0,
              optionDeliverables: []
  end

  defmodule Option.Deliverables do
    defstruct symbol: nil,
              deliverableUnits: 0,
              currencyType: nil,
              assetType: nil
  end
end
