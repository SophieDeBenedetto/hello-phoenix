defmodule Hello.RegistrationController do
  use Hello.Web, :controller
  alias Hello.User

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render conn, changeset: changeset
  end

  def create(conn, %{"user" => user_params}) do
   changeset = User.changeset(%User{}, user_params)

    if changeset.valid? do
      user = Hello.Registration.create(changeset, Hello.Repo)
      conn
      |> put_flash(:info, "Your account was created")
      |> redirect(to: "/")
    else
      conn
      |> put_flash(:info, "Unable to create account")
      |> render("new.html", changeset: changeset)
    end
  end
end
