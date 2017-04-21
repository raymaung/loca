defmodule Loca.Repo.Migrations.AddTranslationsTable do
  use Ecto.Migration

  def change do
    create table(:translations) do
      add :language, :string
      add :text, :text
      add :phase_id, references(:phases, on_delete: :nothing)
      timestamps()
    end

    create index(:translations, [:phase_id])
  end
end
