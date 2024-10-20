defmodule Cards do
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Hearts", "Diamonds", "Clubs", "Spades"]
    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end
  def shuffle(deck) do
    Enum.shuffle(deck)
  end
  def contains?(deck, hand) do
    Enum.member?(deck, hand)
  end
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end
  def load(filename) do
    # binary = File.read!(filename)
    {status, binary} = File.read(filename)
    case status do
      :ok -> :erlang.binary_to_term(binary)
      :error -> raise "Error reading file: #{status}" # this looks like a formal error version
    end
    # :erlang.binary_to_term(binary)
  end

  # def deal_card(deck) do
  #   deck |> Enum.pop
  # end

end

# iex -S mix to start shell
