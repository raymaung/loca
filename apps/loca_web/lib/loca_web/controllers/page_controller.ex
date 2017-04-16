defmodule Loca.Web.PageController do
  use Loca.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
