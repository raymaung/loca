defmodule Loca.TranslationService.SubmitPhaseTest do
  use ExUnit.Case

  use Loca.DataCase

  alias Loca.TranslationService

  test "submit_phase/1" do
    assert {:ok, phase} = TranslationService.submit_phase(%{language: "eng", text: "hello"})
    assert phase.language == "eng"
    assert phase.text == "hello"
  end

  test "submit_phase/1 - required fields" do
    assert {:error, _} = TranslationService.submit_phase(%{language: "", text: "hello"})
    assert {:error, _} = TranslationService.submit_phase(%{language: "eng", text: ""})
  end
end
