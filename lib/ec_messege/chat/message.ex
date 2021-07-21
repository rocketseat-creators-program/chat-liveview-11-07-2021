defmodule EcMessege.Chat.Message do
  use Ecto.Schema
  import Ecto.Changeset

  alias EcMessege.Auth.User
  alias EcMessage.Chat.Conversation

  schema "chat_messages" do
    field :content, :string

    belongs_to :conversation, Conversation
    belongs_to :user, User
    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:content, :conversation_id, :user_id])
    |> validate_required([:content, :conversation_id, :user_id])
  end
end
