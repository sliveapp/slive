defmodule Slive.User do
  use Ecto.Schema
  import Ecto.Changeset
  #alias Slive.User
  use Coherence.Schema                                    # Add this
  


  schema "users" do
    field :email, :string
    field :encrypted_password, :string
    field :first_name, :string
    field :last_name, :string
    coherence_schema()                                    # Add this

    timestamps()
  end

  @doc false
  def changeset(model, params \\ %{}) do
    model
    |> cast(params, [:first_name, :last_name, :email] ++ coherence_fields())  # Add this
    |> validate_required([:first_name, :last_name, :email])
    |> unique_constraint(:email)
    |> validate_format(:email, ~r/@/)
    |> validate_coherence(params)                         # Add this
  end


  def changeset(model, params, :password) do
    model
    |> cast(params, ~w(password password_confirmation reset_password_token reset_password_sent_at))
    |> validate_coherence_password_reset(params)
  end
end
