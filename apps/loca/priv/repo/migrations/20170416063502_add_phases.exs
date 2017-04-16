defmodule Loca.Repo.Migrations.AddPhases do
  use Ecto.Migration

  def change do
    create table(:phases) do
      add :language, :string
      add :text,  :string
      timestamps()
    end
  end
end
