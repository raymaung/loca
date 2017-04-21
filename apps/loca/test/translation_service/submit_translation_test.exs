defmodule Loca.TranslationService.SubmitTranslationTest do
  use ExUnit.Case

  use Loca.DataCase

  alias Loca.TranslationService

  def fixture(:phase) do
    {:ok, phase} = TranslationService.submit_phase(%{language: "English", text: "hello"})
    phase
  end

  test "submit_translation/2" do
    phase = fixture(:phase)
    assert {:ok, translation} = TranslationService.submit_translation(%{
      phase_id: phase.id,
      language: "Chinese",
      text: "你好"
    })
    assert translation.language == "Chinese"
    assert translation.text == "你好"
    assert translation.phase_id == phase.id
  end

  @tag wip: true
  test "submit_translation/2 required fields" do
    phase = fixture(:phase)
    assert {:error, e} = TranslationService.submit_translation(%{
      phase_id: nil,
      language: "",
      text: ""
    })

    assert {"can't be blank", [validation: :required]} == e.errors[:phase_id]
    assert {"can't be blank", [validation: :required]} == e.errors[:language]
    assert {"can't be blank", [validation: :required]} == e.errors[:text]
  end
end
