defmodule Slive.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :first_name, :string
      add :last_name, :string
      add :encrypted_password, :string
      add :email, :string

      timestamps()
    end

  end
end
