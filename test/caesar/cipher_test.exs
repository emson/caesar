defmodule Caesar.CipherTest do
  use ExUnit.Case
  doctest Caesar.Cipher

  import Caesar.Cipher

  test "encrypt shifts mapping" do
    assert encrypt("abcd", 1) == "zabc"
  end

  test "encrypt handles capitals" do
    assert encrypt("abCD", 1) == "zaBC"
  end

  test "encrypt handles spaces" do
    assert encrypt("ab cd", 1) == "za bc"
  end

  test "encrypt handles other characters" do
    assert encrypt("ab,cd?", 1) == "za,bc?"
  end

  test "encrypt handles chars and numbers" do
    assert encrypt("ab88cd", 1) == "za88bc"
  end

  test "encrypt handles big shift number" do
    assert encrypt("abcd", 27) == "zabc"
  end
end
