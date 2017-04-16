defmodule Loca.TranslationTest do
  use Loca.DataCase

  alias Loca.Translation
  alias Loca.Translation.Phase

  @create_attrs %{language: "eng", text: "hello"}
  @update_attrs %{language: "eng", text: "hello"}
  @invalid_attrs %{language: nil}

  def fixture(:phase, attrs \\ @create_attrs) do
    {:ok, phase} = Translation.create_phase(attrs)
    phase
  end

  test "list_phases/1 returns all phases" do
    phase = fixture(:phase)
    assert Translation.list_phases() == [phase]
  end

  test "get_phase! returns the phase with given id" do
    phase = fixture(:phase)
    assert Translation.get_phase!(phase.id) == phase
  end

  test "create_phase/1 with valid data creates a phase" do
    assert {:ok, %Phase{}} = Translation.create_phase(@create_attrs)
  end

  test "create_phase/1 with invalid data returns error changeset" do
    assert {:error, %Ecto.Changeset{}} = Translation.create_phase(@invalid_attrs)
  end

  test "update_phase/2 with valid data updates the phase" do
    phase = fixture(:phase)
    assert {:ok, phase} = Translation.update_phase(phase, @update_attrs)
    assert %Phase{} = phase
  end

  test "update_phase/2 with invalid data returns error changeset" do
    phase = fixture(:phase)
    assert {:error, %Ecto.Changeset{}} = Translation.update_phase(phase, @invalid_attrs)
    assert phase == Translation.get_phase!(phase.id)
  end

  test "delete_phase/1 deletes the phase" do
    phase = fixture(:phase)
    assert {:ok, %Phase{}} = Translation.delete_phase(phase)
    assert_raise Ecto.NoResultsError, fn -> Translation.get_phase!(phase.id) end
  end

  test "change_phase/1 returns a phase changeset" do
    phase = fixture(:phase)
    assert %Ecto.Changeset{} = Translation.change_phase(phase)
  end
end
