defmodule MangopapayaWeb.PageView do
  use MangopapayaWeb, :view

  def image do
    Enum.random([
      %{type: "Mango", images: ["mango_1.jpg"]},
      %{type: "Papaya", images: ["papaya_1.jpg"]}
    ])
  end
end
