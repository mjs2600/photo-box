defmodule PhotoBox.Photo do
  use PhotoBox.Web, :model

  schema "photos" do
    field :title, :string
    field :folder, :string
    field :file_location, :string

    timestamps
  end

  @required_fields ~w(title folder file_location)
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
