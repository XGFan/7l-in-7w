defmodule VideoStore.Concrete do
  import StateMachine.Behavior
  def state_machine do
    [
      available: [
        rent: [to: :rented, calls: [&VideoStore.renting/1]]
      ],
      rented: [
        return: [to: :available, calls: [&VideoStore.returning/1]],
        lost: [to: :lost, calls: [&VideoStore.losing/1]]
      ],
      lost: []
    ]
  end

  def rent(video), do: fire(VideoStore.Concrete.state_machine, video, :rent)
  def return(video), do: fire(VideoStore.Concrete.state_machine, video, :return)
  def lost(video), do: fire(VideoStore.Concrete.state_machine, video, :lose)

end
