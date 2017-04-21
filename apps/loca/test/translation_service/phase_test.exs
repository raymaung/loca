defmodule Loca.TranslationService.PhaseTest do
  use ExUnit.Case

  alias Loca.TranslationService.Phase

  test "attributes" do
    p = %Phase{language: "english", text: "Hello"}
    assert p.language == "english"
    assert p.text == "Hello"
  end
end
