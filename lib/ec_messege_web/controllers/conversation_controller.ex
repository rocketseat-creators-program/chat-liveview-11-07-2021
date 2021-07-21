defmodule EcMessegeWeb.ConversationController do
  use EcMessegeWeb, :controller

  alias EcMessage.Chat

  plug EcMessegeWeb.AssignUser, preload: :conversations

  def create(conn, %{"conversation" => params}) do
  end
end
