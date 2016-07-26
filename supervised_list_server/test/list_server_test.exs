defmodule ListServerTest do
  use ExUnit.Case, async: true

  setup do
    ListSupervisor.start_link
    ListServer.clear
  end

  test "starts out empty" do
    assert ListServer.items == []
  end

  test "can add item to list" do
    ListServer.add "book"
    assert ListServer.items == ["book"]
  end

  test "can remove item from list" do
    ListServer.add "book"
    ListServer.add "paperclip"
    ListServer.remove "book"
    assert ListServer.items == ["paperclip"]
  end
end
