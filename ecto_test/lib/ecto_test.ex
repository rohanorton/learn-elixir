defmodule EctoTest do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      supervisor(Repo, [])
    ]

    opts = [strategy: :one_for_one, name: EctoTest.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
