defmodule Broth.Message.Room.Unban do
  use Ecto.Schema

  @primary_key false
  embedded_schema do
    field(:userId, :binary_id)
  end

  import Ecto.Changeset

  alias Kousa.Utils.UUID

  def changeset(changeset, data) do
    changeset
    |> cast(data, [:userId])
    |> validate_required([:userId])
    |> UUID.normalize(:userId)
  end

  defmodule Reply do
    use Ecto.Schema

    @derive {Jason.Encoder, only: []}

    @primary_key false
    embedded_schema do
    end
  end
end