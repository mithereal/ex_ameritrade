defmodule Ameritrade.Instrument do
  @moduledoc false
  defmodule Equity do
    @moduledoc false
    @derive Jason.Encoder
    defstruct assetType: nil,
              cusip: nil,
              symbol: nil,
              description: nil
  end

  defmodule FixedIncome do
    @moduledoc false
    @derive Jason.Encoder
    defstruct assetType: nil,
              cusip: nil,
              symbol: nil,
              description: nil,
              maturityDate: nil,
              variableRate: 0,
              factor: 0
  end

  defmodule MutualFund do
    @moduledoc false
    @derive Jason.Encoder
    defstruct assetType: nil,
              cusip: nil,
              symbol: nil,
              description: nil,
              type: nil
  end

  defmodule CashEquivalent do
    @moduledoc false
    @derive Jason.Encoder
    defstruct assetType: nil,
              cusip: nil,
              symbol: nil,
              description: nil,
              type: nil
  end

  defmodule Option do
    @moduledoc false
    @derive Jason.Encoder
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
    @moduledoc false
    @derive Jason.Encoder
    defstruct symbol: nil,
              deliverableUnits: 0,
              currencyType: nil,
              assetType: nil
  end
end
