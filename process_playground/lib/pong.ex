defmodule Ping do
  def start do
    receive do
      # Send a message to the pid mailbox:
      {:pong, pid} -> send(pid, {:ping, self})
    end
    # needs to invoke itself again to receive more messages:
    start
  end
end
