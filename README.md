# Ameritrade

[![Hex Docs](https://img.shields.io/badge/hex-docs-lightgreen.svg)](https://hexdocs.pm/ameritrade/)
[![Hex.pm](https://img.shields.io/hexpm/dt/ameritrade.svg)](https://hex.pm/packages/ameritrade)
[![License](https://img.shields.io/hexpm/l/ameritrade.svg)](https://github.com/mithereal/ex_ameritrade/blob/master/LICENSE)
[![Last Updated](https://img.shields.io/github/last-commit/mithereal/ex_ameritrade.svg)](https://github.com/mithereal/ex_ameritrade/commits/master)
[![Donate](https://img.shields.io/liberapay/patrons/mithereal)](https://liberapay.com/Mithereal/donate)

**TD Ameritrade Api**

This module gives us oath access to the td ameritrade api located at "https://developer.tdameritrade.com/apis"

We have various modules to deal with request json responses and converting those to structs 

I didnt feel we needed documentation for something as trivial


Modules are in the form ex. Ameritrade.Account, Ameritrade.Subscription,  Ameritrade.Subscription.Key ... modules are located under /lib/schema 

## Installation

If [available in Hex](https://hex.pm/packages/ameritrade), the package can be installed
by adding `ameritrade` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ameritrade, "~> 1.1.1"}
  ]
end
```

## Config

Add to your config.exs
```elixir
config :ameritrade,
  client_id: "client_id"
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/ameritrade](https://hexdocs.pm/ameritrade).

