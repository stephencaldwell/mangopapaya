defmodule MangopapayaWeb.Router do
  use MangopapayaWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", MangopapayaWeb do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", PageController, :index)
  end

  scope "/api", MangopapayaWeb do
    pipe_through(:api)

    get("/", ApiController, :index)
  end

  # Other scopes may use custom stacks.
  # scope "/api", MangopapayaWeb do
  #   pipe_through :api
  # end
end
