defmodule StatesTest do
  use ExUnit.Case
  doctest States

  test "greets the world" do
    assert States.hello() == :world
  end
end

defmodule ConcreteTest do
  use ExUnit.Case

  test "should update count" do
    rented_video = VideoStore.renting(video)
    IO.puts "#{rented_video.log}"
    assert rented_video.times_rented == 1
  end

  def video, do: %Video{title: "X-Men"}
end
