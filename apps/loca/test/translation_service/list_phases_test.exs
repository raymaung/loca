defmodule Loca.TranslationService.ListPhasesTest do
  use ExUnit.Case

  use Loca.DataCase

  alias Loca.TranslationService

  test "list_phases/1 returns all phases" do
    {:ok, phase1} = TranslationService.submit_phase(%{language: "eng", text: "hello1"})
    {:ok, phase2} = TranslationService.submit_phase(%{language: "eng", text: "hello2"})

    phases = TranslationService.list_phases()
    assert Enum.count(phases) == 2
    assert Enum.member?(phases, phase1)
    assert Enum.member?(phases, phase2)
  end
end
