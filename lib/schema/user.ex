defmodule Ameritrade.User.Principals do
  @moduledoc false

  alias Ameritrade.User.Quotes
  alias Ameritrade.User.StreamerInfo
  alias Ameritrade.User.StreamerSubscriptionKeys
  alias Ameritrade.User.Account

  @type t :: %__MODULE__{
          authToken: String.t() | nil,
          userId: String.t() | nil,
          userCdDomainId: String.t() | nil,
          primaryAccountId: String.t() | nil,
          lastLoginTime: String.t() | nil,
          tokenExpirationTime: String.t() | nil,
          accessLevel: String.t() | nil,
          stalePassword: String.t() | nil,
          streamerInfo: map,
          professionalStatus: String.t() | nil,
          quotes: map,
          streamerSubscriptionKeys: map,
          accounts: list
        }

  @derive Jason.Encoder
  defstruct authToken: nil,
            userId: nil,
            userCdDomainId: nil,
            primaryAccountId: nil,
            lastLoginTime: nil,
            tokenExpirationTime: nil,
            accessLevel: nil,
            stalePassword: nil,
            streamerInfo: %{},
            professionalStatus: nil,
            quotes: %{},
            streamerSubscriptionKeys: %{},
            accounts: []
end

defmodule Ameritrade.User.StreamerInfo do
  @moduledoc false
  @type t :: %__MODULE__{
          streamerBinaryUrl: String.t() | nil,
          streamerSocketUrl: String.t() | nil,
          token: String.t() | nil,
          tokenTimestamp: String.t() | nil,
          userGroup: String.t() | nil,
          accessLevel: String.t() | nil,
          acl: String.t() | nil,
          appId: String.t() | nil
        }
  @derive Jason.Encoder
  defstruct streamerBinaryUrl: nil,
            streamerSocketUrl: nil,
            token: nil,
            tokenTimestamp: nil,
            userGroup: nil,
            accessLevel: nil,
            acl: nil,
            appId: nil
end

defmodule Ameritrade.User.Quotes do
  @moduledoc false

  @type t :: %__MODULE__{
          isNyseDelayed: Boolean.t(),
          isNasdaqDelayed: Boolean.t(),
          isOpraDelayed: Boolean.t(),
          isAmexDelayed: Boolean.t(),
          isCmeDelayed: Boolean.t(),
          isIceDelayed: Boolean.t(),
          isForexDelayed: Boolean.t()
        }
  @derive Jason.Encoder
  defstruct isNyseDelayed: false,
            isNasdaqDelayed: false,
            isOpraDelayed: false,
            isAmexDelayed: false,
            isCmeDelayed: false,
            isIceDelayed: false,
            isForexDelayed: false
end

defmodule Ameritrade.User.StreamerSubscriptionKeys do
  @moduledoc false

  @type t :: %__MODULE__{
          keys: list
        }
  @derive Jason.Encoder
  defstruct keys: []
end

defmodule Ameritrade.User.Account do
  @moduledoc false

  alias Ameritrade.User.Account.Preferences
  alias Ameritrade.User.Account.Authorizations

  @type t :: %__MODULE__{
          accountId: String.t() | nil,
          description: String.t() | nil,
          displayName: String.t() | nil,
          accountCdDomainId: String.t() | nil,
          company: String.t() | nil,
          segment: String.t() | nil,
          surrogateIds: map | nil,
          preferences: map,
          acl: String.t() | nil,
          authorizations: map
        }
  @derive Jason.Encoder
  defstruct accountId: nil,
            description: nil,
            displayName: nil,
            accountCdDomainId: nil,
            company: nil,
            segment: nil,
            surrogateIds: nil,
            preferences: %{},
            acl: nil,
            authorizations: %{}
end

defmodule Ameritrade.User.Account.Preferences do
  @moduledoc false

  @type t :: %__MODULE__{
          expressTrading: Boolean.t(),
          directOptionsRouting: Boolean.t(),
          directEquityRouting: Boolean.t(),
          defaultEquityOrderLegInstruction: String.t() | nil,
          defaultEquityOrderType: String.t() | nil,
          defaultEquityOrderPriceLinkType: String.t() | nil,
          defaultEquityOrderDuration: String.t() | nil,
          defaultEquityOrderMarketSession: String.t() | nil,
          defaultEquityQuantity: String.t() | nil,
          mutualFundTaxLotMethod: String.t() | nil,
          optionTaxLotMethod: String.t() | nil,
          equityTaxLotMethod: String.t() | nil,
          defaultAdvancedToolLaunch: String.t() | nil,
          authTokenTimeout: String.t() | nil
        }
  @derive Jason.Encoder
  defstruct expressTrading: false,
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
end

defmodule Ameritrade.User.Account.Authorizations do
  @moduledoc false

  @type t :: %__MODULE__{
          apex: Boolean.t(),
          levelTwoQuotes: Boolean.t(),
          stockTrading: Boolean.t(),
          marginTrading: Boolean.t(),
          streamingNews: Boolean.t(),
          optionTradingLevel: Boolean.t(),
          streamerAccess: Boolean.t(),
          advancedMargin: Boolean.t(),
          scottradeAccount: Boolean.t()
        }
  @derive Jason.Encoder
  defstruct apex: false,
            levelTwoQuotes: false,
            stockTrading: false,
            marginTrading: false,
            streamingNews: false,
            optionTradingLevel: nil,
            streamerAccess: false,
            advancedMargin: false,
            scottradeAccount: false
end
