defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling a deck of cards.
  """
  @doc """
    Returns a list of strings representing a deck of playing cards.
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"]
    suits = ["Hearts", "Diamonds", "Clubs", "Spades"]
    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end
  def shuffle(deck) do
    Enum.shuffle(deck)
  end
  @doc """
    Determines wheather a deck contains a given card.

  ## Examples
      iex> deck = Cards.create_deck()
      iex> Cards.contains?(deck, "Ace of Hearts")
      true
  """
  def contains?(deck, hand) do
    Enum.member?(deck, hand)
  end
  @doc """
    Divides a deck into a hand and the remainer of the deck.  The `hand_size` argument indicates how many cards should me in the hand.

  ## Examples
      iex> deck = Cards.create_deck()
      iex> {hand, deck}=Cards.deal(deck,1)
      iex> hand
      ["Ace of Hearts"]
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end
  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> raise "Error reading file" # this looks like a formal error version
    end
  end
  def create_hand(hand_size) do
    Cards.create_deck() # these pipes pass prev value as first arg
    |> Cards.shuffle()
    |> Cards.deal(hand_size)
    # |> List.first()
  end

  # def deal_card(deck) do
  #   deck |> Enum.pop
  # end

end

# iex -S mix to start shell
