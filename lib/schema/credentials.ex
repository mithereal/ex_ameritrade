defmodule Ameritrade.Credentials do
  @moduledoc false
  @derive Jason.Encoder
  defstruct [
   :userid,
   :token,
   :company,
   :segment,
   :cddomain,
   :usergroup,
   :accesslevel,
   :authorized,
   :timestamp,
   :appid,
   :acl
   ]
end

