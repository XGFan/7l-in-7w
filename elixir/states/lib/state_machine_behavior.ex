defmodule StateMachine.Behavior do
  def fire(context, event) do
    %{context | state: event[:to]} |> activate(event)
  end

  def fire(states, context, event_name) do
    # 状态机[现在的状态][执行的事件]
    event = states[context.state][event_name]
    # 执行event
    fire(context, event)
  end

  def activate(context, event) do
    Enum.reduce(event[:calls] || [], context, & &1.(&2))
  end
end
