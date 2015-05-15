defmodule PhotoBox.PhotoController do
  use PhotoBox.Web, :controller

  alias PhotoBox.Photo

  plug :scrub_params, "photo" when action in [:create, :update]
  plug :action

  def index(conn, _params) do
    photos = Repo.all(Photo)
    render(conn, "index.html", photos: photos)
  end

  def new(conn, _params) do
    changeset = Photo.changeset(%Photo{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"photo" => photo_params}) do
    changeset = Photo.changeset(%Photo{}, photo_params)

    if changeset.valid? do
      Repo.insert(changeset)

      conn
      |> put_flash(:info, "Photo created successfully.")
      |> redirect(to: photo_path(conn, :index))
    else
      render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    photo = Repo.get(Photo, id)
    render(conn, "show.html", photo: photo)
  end

  def edit(conn, %{"id" => id}) do
    photo = Repo.get(Photo, id)
    changeset = Photo.changeset(photo)
    render(conn, "edit.html", photo: photo, changeset: changeset)
  end

  def update(conn, %{"id" => id, "photo" => photo_params}) do
    photo = Repo.get(Photo, id)
    changeset = Photo.changeset(photo, photo_params)

    if changeset.valid? do
      Repo.update(changeset)

      conn
      |> put_flash(:info, "Photo updated successfully.")
      |> redirect(to: photo_path(conn, :index))
    else
      render(conn, "edit.html", photo: photo, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    photo = Repo.get(Photo, id)
    Repo.delete(photo)

    conn
    |> put_flash(:info, "Photo deleted successfully.")
    |> redirect(to: photo_path(conn, :index))
  end
end
