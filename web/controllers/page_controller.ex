defmodule PhotoBox.PageController do
  use PhotoBox.Web, :controller

  plug :action

  def index(conn, _params) do
    render conn, "index.html"
  end
end
