# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Slive.Repo.insert!(%Slive.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
#
Slive.Repo.delete_all Slive.User

Slive.User.changeset(%Slive.User{}, %{first_name: "Test", last_name: "User", email: "test@test.com", password: "secret", password_confirmation: "secret"})
|> Slive.Repo.insert!
