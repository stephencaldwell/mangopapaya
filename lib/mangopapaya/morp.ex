defmodule Mangopapaya.Morp do
  def get_morp() do
    morp =
      Enum.random([
        %{type: "Mango", images: ["mango_1.jpg"]},
        %{type: "Papaya", images: ["papaya_1_sm.jpg"]}
      ])

    %{type: morp.type, image: Enum.random(morp.images)}
  end
end
