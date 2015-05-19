defmodule PhotoBox.Repo.Migrations.CreatePhotoTag do
  use Ecto.Migration

  def change do
    create table(:photo_tags) do
      add :photo_id, references(:photos)
      add :tag_id, references(:tags)

      timestamps
    end

  end
end
