defmodule Pong do
  def start do
    await(0)
  end

  def await(count) do
    receive do
      # Send a message to the pid mailbox:
      {:ping, pid} -> send(pid, {:pong, self})
    end
    IO.puts "Pong received a ping #{count + 1} times"
    # needs to invoke itself again to receive more messages:
    await(count + 1)
  end
end
