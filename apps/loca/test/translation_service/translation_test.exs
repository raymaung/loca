defmodule Loca.TranslationService.TranslationTest do
  use ExUnit.Case

  alias Loca.TranslationService.Translation
  alias Loca.TranslationService.Phase

  test "attributes" do
    p = %Phase{language: "english", text: "Hello"}
    t = %Translation{language: "french", text: "Bonjour", phase: p}
    assert t.language == "french"
    assert t.text == "Bonjour"
    assert t.phase == p
  end
end
