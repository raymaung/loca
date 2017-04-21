defmodule Loca.Translation.PhaseTest do
  use ExUnit.Case

  alias Loca.Translation.Phase

  test "attributes" do
    p = %Phase{language: "english", text: "Hello"}
    assert p.language == "english"
    assert p.text == "Hello"
  end
end
