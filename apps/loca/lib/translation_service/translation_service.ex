defmodule Loca.TranslationService do

  import Ecto.{Query, Changeset}, warn: false
  alias Loca.Repo

  alias Loca.TranslationService.Phase
  alias Loca.TranslationService.Translation

  def submit_phase(attrs \\ %{}) do
    %Phase{}
    |> phase_changeset(attrs)
    |> Repo.insert()
  end

  def list_phases do
    Repo.all(Phase)
  end

  def submit_translation(attrs \\ %{}) do
    %Translation{}
    |> translation_changeset(attrs)
    |> Repo.insert()
  end

  def get_phase_with_translations(phase_id) do
    Repo.get(Phase, phase_id)
    |> Repo.preload([:translations])
  end

  defp phase_changeset(%Phase{} = phase, attrs) do
    phase
    |> cast(attrs, [:language, :text])
    |> validate_required([:language, :text])
  end

  defp translation_changeset(%Translation{} = translation, attrs) do
    translation
    |> cast(attrs, [:phase_id, :language, :text])
    |> validate_required([:phase_id, :language, :text])
  end





  ## Generated Code

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

end
