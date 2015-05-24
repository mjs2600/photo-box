defmodule PhotoBox.Photo do
  import Ecto.Query
  use PhotoBox.Web, :model

  schema "photos" do
    field :folder, :string
    field :file_location, :string
    has_many :photo_tags, PhotoBox.PhotoTag

    timestamps
  end

  @required_fields ~w(folder file_location)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If `params` are nil, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end

  def with_tags(query) do
    from photo in query,
    preload: [photo_tags: :tag]
  end
end
