defmodule TextClient.State do
  @moduledoc """
    TextClient.State manages the state of a current game, including
    the game_service, the current tally, and current guessed letters.
  """
  defstruct game_service: nil,
            tally: nil,
            guess: ""
end
