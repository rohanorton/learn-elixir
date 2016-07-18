# List Comprehensions

List comprehensions are a nice syntax for looping over enumerables to create new
ones:

```elixir
for x <- [1,2,3,4,5], do: x * 4
# => [4,8,12,16,20]

for x <- 1..10, rem(x, 2) == 0, do: x
# => [2, 4, 6, 8, 10]

for x <- [1,3,5], y <- [2,4,6], do: {x, y}
# => [{1, 2}, {1, 4}, {1, 6}, {3, 2}, {3, 4}, {3, 6}, {5, 2}, {5, 4}, {5, 6}]

```


