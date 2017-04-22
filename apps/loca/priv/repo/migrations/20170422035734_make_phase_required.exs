defmodule Loca.Repo.Migrations.MakePhaseRequired do
  use Ecto.Migration

  def change do
    alter table(:translations) do
      modify :phase_id, :integer, null: false
    end
  end

end
