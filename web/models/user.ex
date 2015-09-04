defmodule Hello.User do
  use Hello.Web, :model

  schema "users" do
    field :name, :string
    field :email, :string
    field :bio, :string
    field :crypted_password, :string
    field :password, :string, virtual: true
    
    has_many :messags, Hello.Message

    timestamps
  end

  @required_fields ~w(name email password)
  @optional_fields ~w(bio)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """

  def changeset(model, params \\ :empty) do
  model
  |> cast(params, @required_fields, @optional_fields)
  |> validate_format(:email, ~r/@/)
  |> validate_length(:password, min: 5)
end
end
