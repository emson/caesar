defmodule Caesar do
  alias Caesar.Cipher

  @moduledoc """
  Command line tool for generating a Caesar cipher
  from plain text input.
  """

  def main(argv) do
    argv
      |> parse_args
      |> process
    System.halt(0)
  end

  @doc """
  Parse the argument variables (`argv`).
  -h or --help returns help.

  `encrypt` will encrypt the plain text message using the Caesar
  cipher, and will `--shift 4` the alphabet by `4` letters.

  Return a tuple containing the `action`, `message`, and the `shift`
  value to encrypt the message by.

      iex> Caesar.parse_args(["help"])
      {:help}

      iex> Caesar.parse_args(["encrypt", "abc", "--shift", "1"])
      {:encrypt, "abc", 1}
  """
  def parse_args(argv) do
    parse = OptionParser.parse(argv, switches: [help: :boolean])
    case parse do
      {[help: true],   _______________,  _} ->  {:help}
      {[shift: shift], ["encrypt", msg],  _} -> {:encrypt, msg, shift |> String.to_integer}
      _____________________________________ ->  {:help}
    end
  end

  @doc """
  Return a JSON string of the encrypted message.
  """
  def process({:encrypt, msg, shift}) do
    Cipher.apply_shift(msg, shift)
      |> IO.puts
  end

  @doc """
  Return the help information for this command line tool.
  """
  def process({:help}) do
    IO.puts """
    usage: ./caesar <command> <message> --shift <shift_number>
    """
  end
end
