defmodule ListSupervisor do
  use Supervisor

  def start_link do
    result = {:ok, sup} = :supervisor.start_link(__MODULE__, [])
    start_workers(sup)
    result
  end

  def start_workers(sup) do
    # Start ListData worker
    {:ok, list_data_pid} = :supervisor.start_child(sup, worker(ListData, []))
    # Start SubSupervisor for ListServer
    :supervisor.start_child(sup, worker(ListSubSupervisor, [list_data_pid]))
  end

  def init(_) do
    supervise [], strategy: :one_for_one
  end
end
