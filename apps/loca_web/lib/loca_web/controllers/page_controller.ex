defmodule Loca.Web.PageController do
  use Loca.Web, :controller

  alias Loca.TranslationService

  def index(conn, _params) do
    phases = TranslationService.list_phases
    render conn, "index.html", phases: phases
  end
end
