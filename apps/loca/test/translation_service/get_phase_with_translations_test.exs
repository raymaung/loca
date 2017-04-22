defmodule Loca.TranslationService.GetPhaseWithTranslationsTest do
  use ExUnit.Case

  use Loca.DataCase

  alias Loca.TranslationService

  def fixture(:phase) do
    {:ok, phase} = TranslationService.submit_phase(%{language: "English", text: "hello"})
    phase
  end

  def fixture(:translation, phase) do
    {:ok, translation} = TranslationService.submit_translation(%{
      phase_id: phase.id,
      language: "Chinese",
      text: "你好"
    })
    translation
  end

  test "get_phase_with_translations/1" do
    phase = fixture(:phase)
    translation1 = fixture(:translation, phase)
    translation2 = fixture(:translation, phase)

    p = TranslationService.get_phase_with_translations(phase.id)
    assert p.translations |> Enum.count == 2
  end

end
