defmodule Loca.Translation do
  @moduledoc """
  The boundary for the Translation system.
  """

  import Ecto.{Query, Changeset}, warn: false
  alias Loca.Repo

  alias Loca.Translation.Phase

  @doc """
  Submit a phase to be translated

  ## Examples

      iex> submit_phase(%{language: "english", text: "Hello"})
      {:ok, %Phase{language: "english", "Hello"}}

      iex> submit_phase(%{language: "", text: ""})
      {:error, %Ecto.Changeset{}}

  """
  def submit_phase(attrs \\ %{}) do
    %Phase{}
    |> phase_changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Returns the list of phases.

  ## Examples

      iex> list_phases()
      [%Phase{}, ...]

  """
  def list_phases do
    Repo.all(Phase)
  end

  @doc """
  Gets a single phase.

  Raises `Ecto.NoResultsError` if the Phase does not exist.

  ## Examples

      iex> get_phase!(123)
      %Phase{}

      iex> get_phase!(456)
      ** (Ecto.NoResultsError)

  """
  def get_phase!(id), do: Repo.get!(Phase, id)


  @doc """
  Updates a phase.

  ## Examples

      iex> update_phase(phase, %{field: new_value})
      {:ok, %Phase{}}

      iex> update_phase(phase, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_phase(%Phase{} = phase, attrs) do
    phase
    |> phase_changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Phase.

  ## Examples

      iex> delete_phase(phase)
      {:ok, %Phase{}}

      iex> delete_phase(phase)
      {:error, %Ecto.Changeset{}}

  """
  def delete_phase(%Phase{} = phase) do
    Repo.delete(phase)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking phase changes.

  ## Examples

      iex> change_phase(phase)
      %Ecto.Changeset{source: %Phase{}}

  """
  def change_phase(%Phase{} = phase) do
    phase_changeset(phase, %{})
  end

  defp phase_changeset(%Phase{} = phase, attrs) do
    phase
    |> cast(attrs, [:language, :text])
    |> validate_required([:language, :text])
  end
end
