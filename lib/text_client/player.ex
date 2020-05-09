defmodule TextClient.Player do
  alias TextClient.{Mover, Prompter, State, Summary}

  def play(%State{tally: %{game_state: :won}}) do
    exit_with_message("Winner, winner, chiken-dinner!")
  end

  def play(%State{tally: %{game_state: :lost}}) do
    exit_with_message("Sorry, you have lost at hangman...")
  end

  def play(game = %State{tally: %{game_state: :good_guess}}) do
    continue_with_message(game, "Good guess!")
  end

  def play(game = %State{tally: %{game_state: :bad_guess}}) do
    continue_with_message(game, "Sorry, that is not in the word...")
  end

  def play(game = %State{tally: %{game_state: :alread_used}}) do
    continue_with_message(game, "You've already used that letter")
  end

  def play(game), do: continue(game)

  defp continue(game) do
    game
    |> Summary.display()
    |> Prompter.accept_move()
    |> Mover.make_move()
    |> play()
  end

  def display(game) do
    game
  end

  def prompt(game) do
    game
  end

  def make_move(game) do
    game
  end

  defp continue_with_message(game, message) do
    IO.puts(message)
    continue(game)
  end

  defp exit_with_message(message) do
    IO.puts(message)
    exit(:normal)
  end
end
