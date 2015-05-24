defmodule PhotoBox.Repo.Migrations.CreatePhoto do
  use Ecto.Migration

  def change do
    create table(:photos) do
      add :folder, :string

      timestamps
    end

  end
end
