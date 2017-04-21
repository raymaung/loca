defmodule Loca.TranslationTest do
  use ExUnit.Case

  use Loca.DataCase

  alias Loca.Translation

  test "submit phase" do
    assert {:ok, phase} = Translation.submit_phase(%{language: "eng", text: "hello"})
    assert phase.language == "eng"
    assert phase.text == "hello"
  end

  test "submit phase - required fields" do
    assert {:error, _} = Translation.submit_phase(%{language: "", text: "hello"})
    assert {:error, _} = Translation.submit_phase(%{language: "eng", text: ""})
  end
end
