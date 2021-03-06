defmodule Loca.Application do
  @moduledoc """
  The Loca Application Service.

  The loca system business domain lives in this application.

  Exposes API to clients such as the `Loca.Web` application
  for use in channels, controllers, and elsewhere.
  """
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    Supervisor.start_link([
      worker(Loca.Repo, []),
    ], strategy: :one_for_one, name: Loca.Supervisor)
  end
end
