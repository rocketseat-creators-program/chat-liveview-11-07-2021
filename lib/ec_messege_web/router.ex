defmodule EcMessegeWeb.Router do
  use EcMessegeWeb, :router
  use Pow.Phoenix.Router

  import Phoenix.LiveView.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :fetch_live_flash
    plug :put_root_layout, {EcMessegeWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :protected do
    plug Pow.Plug.RequireAuthenticated,
      error_handler: Pow.Phoenix.PlugErrorHandler
  end

  scope "/" do
    pipe_through :browser

    pow_routes()
  end

  scope "/", EcMessegeWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/", EcMessegeWeb do
    pipe_through [:browser, :protected]

    resources "/conversations", ConversationController

    live "/conversations/:conversation_id/users/:user_id", ConversationLive, as: :conversation
  end

  # Other scopes may use custom stacks.
  # scope "/api", EcMessegeWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: EcMessegeWeb.Telemetry
    end
  end
end
