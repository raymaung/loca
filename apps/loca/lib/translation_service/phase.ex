defmodule Loca.TranslationService.Phase do
  use Ecto.Schema

  alias Loca.TranslationService.Translation

  schema "phases" do
    field :language, :string
    field :text, :string
    has_many :translations, Translation
    timestamps()
  end
end
