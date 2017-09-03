defmodule Slive.Public.Event do
  use Ecto.Schema
  import Ecto.Changeset
  alias Slive.Public.Event


  schema "events" do
    field :description, :string
    field :title, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Event{} = event, attrs) do
    event
    |> cast(attrs, [:title, :description])
    |> validate_required([:title, :description])
  end
end
