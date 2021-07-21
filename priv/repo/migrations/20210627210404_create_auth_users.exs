defmodule EcMessege.Repo.Migrations.CreateAuthUsers do
  use Ecto.Migration

  def change do
    create table(:auth_users) do
      add :nickname, :string, null: false
      add :email, :string, null: false
      add :password_hash, :string

      timestamps()
    end

    create unique_index(:auth_users, [:nickname])
    create unique_index(:auth_users, [:email])
  end
end
