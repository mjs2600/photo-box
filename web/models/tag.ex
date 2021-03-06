defmodule PhotoBox.Tag do
  use PhotoBox.Web, :model

  schema "tags" do
    field :name, :string
    has_many :photo_tags, PhotoBox.PhotoTag

    timestamps
  end

  @required_fields ~w(name)
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
end
