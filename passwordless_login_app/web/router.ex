defmodule PasswordlessLoginApp.Router do
  use PasswordlessLoginApp.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PasswordlessLoginApp do
    pipe_through [:browser, PasswordlessLoginApp.SimpleAuth] # Use the default browser stack

    get "/", PageController, :index
    resources "/session", SessionController, only: [:new, :create, :show]

    # can't add a delete action in the first resources because it will create a
    # route for DELETE /session/:id, and we only need to delete a single
    # session DELETE /session; so, we included the singleton option.
    resources "/session", SessionController, only: [:delete], singleton: true
  end

  # Other scopes may use custom stacks.
  # scope "/api", PasswordlessLoginApp do
  #   pipe_through :api
  # end
end
