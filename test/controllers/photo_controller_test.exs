defmodule PhotoBox.PhotoControllerTest do
  use PhotoBox.ConnCase

  alias PhotoBox.Photo
  @valid_params photo: %{folder: "some content", title: "some content", image: %Plug.Upload{content_type: "image/png", filename: "test.bpng", path: "test/priv/test.png"}}
  @invalid_params photo: %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "GET /photos", %{conn: conn} do
    conn = get conn, photo_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing photos"
  end

  test "GET /photos/new", %{conn: conn} do
    conn = get conn, photo_path(conn, :new)
    assert html_response(conn, 200) =~ "New photo"
  end

  test "POST /photos with valid data", %{conn: conn} do
    conn = post conn, photo_path(conn, :create), @valid_params
    assert redirected_to(conn) == photo_path(conn, :index)
  end

  #test "POST /photos with invalid data", %{conn: conn} do
  #  conn = post conn, photo_path(conn, :create), @invalid_params
  #  assert html_response(conn, 200) =~ "New photo"
  #end

  test "GET /photos/:id", %{conn: conn} do
    photo = Repo.insert %Photo{file_location: "test/priv/test.png", folder: "test_directory"}
    conn = get conn, photo_path(conn, :show, photo)
    assert html_response(conn, 200) =~ "/test_directory/"
  end

  test "GET /photos/:id/edit", %{conn: conn} do
    photo = Repo.insert %Photo{}
    conn = get conn, photo_path(conn, :edit, photo)
    assert html_response(conn, 200) =~ "Edit photo"
  end

  test "PUT /photos/:id with valid data", %{conn: conn} do
    photo = Repo.insert %Photo{file_location: "test/priv/test.png", folder: "test_directory"}
    conn = put conn, photo_path(conn, :update, photo), @valid_params
    assert redirected_to(conn) == photo_path(conn, :index)
  end

  test "PUT /photos/:id with invalid data", %{conn: conn} do
    photo = Repo.insert %Photo{}
    conn = put conn, photo_path(conn, :update, photo), @invalid_params
    assert html_response(conn, 200) =~ "Edit photo"
  end

  test "DELETE /photos/:id", %{conn: conn} do
    photo = Repo.insert %Photo{}
    conn = delete conn, photo_path(conn, :delete, photo)
    assert redirected_to(conn) == photo_path(conn, :index)
    refute Repo.get(Photo, photo.id)
  end
end
