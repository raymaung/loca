defmodule Loca.TranslationService.Phase do
  use Ecto.Schema

  schema "phases" do
    field :language, :string
    field :text, :string
    timestamps()
  end
end
