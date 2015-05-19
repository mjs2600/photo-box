defmodule PhotoBox.ImageTagTest do
  use PhotoBox.ModelCase

  alias PhotoBox.ImageTag

  @valid_attrs %{image_id: 42, tag_id: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = ImageTag.changeset(%ImageTag{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = ImageTag.changeset(%ImageTag{}, @invalid_attrs)
    refute changeset.valid?
  end
end
