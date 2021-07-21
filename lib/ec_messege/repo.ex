defmodule EcMessege.Repo do
  use Ecto.Repo,
    otp_app: :ec_messege,
    adapter: Ecto.Adapters.Postgres
end
