defmodule VideoStore do
  def renting(video) do
    # 创建一个新的video，记录日志
    vid = log(video, "Renting #{video.title}")
    # 创建新的video，借出计数+1
    %{vid | times_rented: video.times_rented + 1}
  end

  def returning(video) do
    log(video, "Returning #{video.title}")
  end

  def losing(video) do
    log(video, "Losing #{video.title}")
  end

  def log(video, message) do
    # 创建一个新的video对象，以原来的为基础，只是多了一个日志而已
    %{video | log: [message | video.log]}
  end
end
