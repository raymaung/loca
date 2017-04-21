defmodule Loca.TranslationService.Translation do
  use Ecto.Schema

  schema "translations" do
    field :language, :string
    field :text, :string
    belongs_to :phase, Loca.TranslationService.Phase

    timestamps()
  end
end
