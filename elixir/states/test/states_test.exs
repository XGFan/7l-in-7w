defmodule StatesTest do
  use ExUnit.Case
  doctest States

  test "greets the world" do
    assert States.hello() == :world
  end
end

defmodule ConcreteTest do
  use ExUnit.Case
  import Should

  def video, do: %Video{title: "X-Men"}

  should "update count" do
    rented_video = VideoStore.renting(video)
    IO.puts "#{rented_video.log}"
    assert rented_video.times_rented == 1
  end

  should "rent video" do
    rented_video = VideoStore.Concrete.rent video
    assert :rented == rented_video.state
    assert 1 == Enum.count(rented_video.log)
  end

  should "handle multiple transitions" do
    import VideoStore.Concrete
    vid = video |> rent |> return |> rent |> return |> rent
    assert 5 == Enum.count(vid.log)
    assert 3 == vid.times_rented
  end

end
