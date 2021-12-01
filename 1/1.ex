defmodule Part1 do
  def higherOrLower([previous, current]) when current > previous, do: 1
  def higherOrLower([_previous, _current]), do: 0
  def higherOrLower( [previous, current | tail]) when current > previous do
      1 + higherOrLower([current| tail])
  end
   def higherOrLower( [_previous, current | tail]) do
    higherOrLower([current| tail])
  end
end

defmodule Part2 do
  def higherOrLower( [a , b, c, d]) when b+c+d > a+b+c,  do: 1
  def higherOrLower( [_a ,_b, _c, _d]), do: 0
  def higherOrLower( [a , b, c, d | tail]) when b+c+d > a+b+c do
      1 + higherOrLower([b|[c|[d|tail]]])
  end
  def higherOrLower( [_a , b, c, d | tail]) do
      higherOrLower([b|[c|[d|tail]]])
  end
end

lines = File.read!("input.txt") 
|> String.trim 
|> String.split("\n") 
|> Enum.map(&String.to_integer/1)

IO.puts "Part 1"
IO.inspect Part1.higherOrLower(lines)
IO.puts "Part 2"
IO.inspect Part2.higherOrLower(lines)