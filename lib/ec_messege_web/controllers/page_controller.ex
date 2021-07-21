defmodule EcMessegeWeb.PageController do
  use EcMessegeWeb, :controller

  plug EcMessegeWeb.AssignUser, preload: :conversations

  def index(conn, opts \\ []) do
    render(conn, "index.html")
  end
end
