defmodule Ameritrade.Preferences do
  @moduledoc false
  @derive Jason.Encoder
  defstruct(
    expressTrading: false,
    directOptionsRouting: false,
    directEquityRouting: false,
    defaultEquityOrderLegInstruction: nil,
    defaultEquityOrderType: nil,
    defaultEquityOrderPriceLinkType: nil,
    defaultEquityOrderDuration: nil,
    defaultEquityOrderMarketSession: nil,
    defaultEquityQuantity: 0,
    mutualFundTaxLotMethod: nil,
    optionTaxLotMethod: nil,
    equityTaxLotMethod: nil,
    defaultAdvancedToolLaunch: nil,
    authTokenTimeout: nil
  )
end
