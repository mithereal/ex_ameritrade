defmodule Ameritrade.OAuth do
  use OAuth2.Strategy

  @defaults [
    strategy: __MODULE__,
    site: "https://auth.tdameritrade.com",
    authorize_url: "https://auth.tdameritrade.com/auth",
    token_url: "https://api.tdameritrade.com/v1/oauth2/token"
  ]

  def client(opts \\ []) do
    config = Application.fetch_env!(:ameritrade, :client_id)

    config = to_string(config)

    client_id = config <> "@AMER.OAUTHAP"

    client_id = [client_id: client_id]

    opts = @defaults |> Keyword.merge(opts) |> Keyword.merge(client_id) |> resolve_values()

    OAuth2.Client.new(opts)
    |> OAuth2.Client.put_serializer("application/json", Jason)
  end

  @doc """
  Provides the authorize url.
  """
  def authorize_url!(params \\ [], opts \\ []) do
    opts
    |> client
    |> OAuth2.Client.authorize_url!(params)
  end

  def get(token, url, headers \\ [], opts \\ []) do
    [token: token]
    |> client
    |> OAuth2.Client.get(url, headers, opts)
  end

  def post(token, url, body, headers \\ [], opts \\ []) do
    [token: token]
    |> client
    |> OAuth2.Client.post(url, body, headers, opts)
  end

  def put(token, url, body, headers \\ [], opts \\ []) do
    [token: token]
    |> client
    |> OAuth2.Client.put(url, body, headers, opts)
  end

  def delete(token, url, headers \\ [], opts \\ []) do
    [token: token]
    |> client
    |> OAuth2.Client.delete(url, headers, opts)
  end

  def patch(token, url, headers \\ [], opts \\ []) do
    [token: token]
    |> client
    |> OAuth2.Client.patch(url, headers, opts)
  end

  def get_token!(params \\ [], opts \\ []) do
    client =
      client(opts)
      |> OAuth2.Client.get_token(params)

    {_, token} =
      case client do
        {:error, %{body: %{"error" => description}, status_code: error}} ->
          {:error,
           %{
             access_token: nil,
             other_params: [
               error: error,
               error_description: description
             ]
           }}

        {:ok, %{token: token}} ->
          {:ok, token}

        {:ok, %{body: %{token: token}}} ->
          {:ok, token}
      end

    token
  end

  # Strategy Callbacks

  def authorize_url(client, params) do
    OAuth2.Strategy.AuthCode.authorize_url(client, params)
  end

  def get_token(client, params, headers) do
    {code, params} = Keyword.pop(params, :code, client.params["code"])

    unless code do
      raise OAuth2.Error, reason: "Missing required key `code` for `#{inspect(__MODULE__)}`"
    end

    client
    |> put_header("Accept", "application/json")
    |> put_header("Content-Type", "application/x-www-form-urlencoded")
    |> put_param(:code, code)
    |> put_param(:grant_type, "authorization_code")
    |> put_param(:access_type, "offline")
    |> put_param(:client_id, client.client_id)
    |> put_param(:redirect_uri, client.redirect_uri)
    |> merge_params(params)
    |> put_headers(headers)
  end

  defp resolve_values(list) do
    for {key, value} <- list do
      {key, resolve_value(value)}
    end
  end

  defp resolve_value({m, f, a}) when is_atom(m) and is_atom(f), do: apply(m, f, a)
  defp resolve_value(v), do: v

  @doc """
  Adds `authorization` header for ameritrade auth.
  """
  def client_header(%OAuth2.Client{client_id: id, client_secret: secret} = client) do
    put_header(client, "authorization", "Basic " <> Base.encode64(id))
  end
end
