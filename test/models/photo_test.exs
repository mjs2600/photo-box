defmodule PhotoBox.PhotoTest do
  use PhotoBox.ModelCase

  alias PhotoBox.Photo

  @valid_attrs %{folder: "some content", title: "some content", file_location: "test/priv/test.png"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Photo.changeset(%Photo{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Photo.changeset(%Photo{}, @invalid_attrs)
    refute changeset.valid?
  end
end
