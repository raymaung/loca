defmodule Loca.Translation.ListPhasesTest do
  use ExUnit.Case

  use Loca.DataCase

  alias Loca.Translation

  test "list_phases/1 returns all phases" do
    {:ok, phase1} = Translation.submit_phase(%{language: "eng", text: "hello1"})
    {:ok, phase2} = Translation.submit_phase(%{language: "eng", text: "hello2"})

    phases = Translation.list_phases()
    assert Enum.count(phases) == 2
    assert Enum.member?(phases, phase1)
    assert Enum.member?(phases, phase2)
  end
end
