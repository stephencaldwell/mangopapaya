defmodule MangopapayaWeb.PageView do
  use MangopapayaWeb, :view

  def image do
    Mangopapaya.Morp.get_morp()
  end
end
