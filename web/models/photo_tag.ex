defmodule PhotoBox.PhotoTag do
  use PhotoBox.Web, :model

  schema "photo_tags" do
    belongs_to :photo, PhotoBox.Photo
    belongs_to :tag, PhotoBox.Tag

    timestamps
  end

  @required_fields ~w(photo_id tag_id)
  @optional_fields ~w()

  def add_photo_tag(photo, tag) do
    Repo.insert(%__MODULE__{photo_id: photo.id, tag_id: tag.id})
  end
end
