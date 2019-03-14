defmodule MangopapayaWeb.PageController do
  use MangopapayaWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
