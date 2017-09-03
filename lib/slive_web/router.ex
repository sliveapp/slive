defmodule SliveWeb.Router do
  use SliveWeb, :router
  use Coherence.Router         # Add this

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session  # Add this
  end


  pipeline :protected do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session, protected: true  # Add this
  end


  pipeline :api do
    plug :accepts, ["json"]
  end


  # Add this block
  scope "/" do
    pipe_through :browser
    coherence_routes()
  end




  scope "/", SliveWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/events", EventController
    
    coherence_routes()
  end


  # Add this block
  scope "/" do
    pipe_through :browser
    
    coherence_routes :protected
  end



  scope "/", SliveWeb do
    pipe_through :protected
    # Add protected routes below
  end

  # Other scopes may use custom stacks.
  # scope "/api", SliveWeb do
  #   pipe_through :api
  # end
end
