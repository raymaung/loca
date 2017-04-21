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

  test "unicode support" do
    p = %Phase{language: "english", text: "Hello"}
    t = %Translation{language: "Chinese", text: "你好", phase: p}
    assert t.text == "你好"
  end

  test "mixing multiple languages" do
    p = %Phase{language: "english", text: "Hello"}
    t = %Translation{language: "Japanese", text: "こんにちはHello", phase: p}
    assert t.text == "こんにちはHello"
  end
end
