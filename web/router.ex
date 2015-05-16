defmodule PhotoBox.Router do
  use PhotoBox.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhotoBox do
    pipe_through :browser # Use the default browser stack

    # get "/photos/dir/:directory", PhotoDirectoryController, :index
    get "/", PhotoController, :index
    resources "/photos", PhotoController

  end

  # Other scopes may use custom stacks.
  # scope "/api", PhotoBox do
  #   pipe_through :api
  # end
end
