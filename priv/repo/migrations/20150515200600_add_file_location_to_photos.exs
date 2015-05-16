defmodule PhotoBox.Repo.Migrations.AddFileLocationToPhotos do
  use Ecto.Migration

  def change do
    alter table(:photos) do
      add :file_location, :string
    end
  end
end
