defmodule Cards do
  def create_deck do
    ["Ace", "Two", "Three"]
  end
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  # def deal_card(deck) do
  #   deck |> Enum.pop
  # end

end

# iex -S mix to start shell
