defmodule MangopapayaWeb.ApiController do
  use MangopapayaWeb, :controller

  def index(conn, _params) do
    morp = Mangopapaya.Morp.get_morp()
    json(conn, %{type: morp.type, image: static_url(conn, "/images/" <> morp.image)})
  end
end
