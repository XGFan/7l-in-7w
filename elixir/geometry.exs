defmodule Rectangle do
    def area({w,h}),do: w*h
    def perimeter({w,h}),do: 2*(w+h)
end

defmodule Square do
    def area({w}), do: Rectangle.area({w,w})
    def area({w,h}) when w == h, do: Rectangle.area({w,h})
    def perimeter({w}), do: Rectangle.perimeter({w,w})
    def perimeter({w,h}) when w == h do
        Rectangle.perimeter({w,h})
    end
end

r = {3,4}
IO.puts "the area of rectangle #{inspect r} is #{Rectangle.area r}"
s = {4}
IO.puts "the area of square #{inspect s} is #{Square.area s}"
IO.puts "the area of square #{inspect r} is #{Square.area r}"
