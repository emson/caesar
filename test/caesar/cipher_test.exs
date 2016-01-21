defmodule Caesar.CipherTest do
  use ExUnit.Case
  doctest Caesar.Cipher

  import Caesar.Cipher

  test "apply_shift shifts mapping" do
    assert apply_shift("abcd", 1) == "zabc"
  end

  test "apply_shift handles capitals" do
    assert apply_shift("abCD", 1) == "zaBC"
  end

  test "apply_shift handles spaces" do
    assert apply_shift("ab cd", 1) == "za bc"
  end

  test "apply_shift handles other characters" do
    assert apply_shift("ab,cd?", 1) == "za,bc?"
  end

  test "apply_shift handles chars and numbers" do
    assert apply_shift("ab88cd", 1) == "za88bc"
  end

  test "apply_shift handles big shift number" do
    assert apply_shift("abcd", 27) == "zabc"
  end
end
