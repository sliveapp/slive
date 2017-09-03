defmodule SliveWeb.PageController do
  use SliveWeb, :controller

  plug Coherence.Authentication.Session, [protected: true]
  

  def index(conn, _params) do
    render conn, "index.html"
  end
end
