# Pattern Matching

## Match Operator

Sort of like assignment, but not. It's more like an assertion.

```elixir
foo = 1 # => 1
1 = foo # => 1
2 = foo # (MatchError)

{:foo, bar} = {:foo, 3}
bar # => 3

{_, baz} = {1, 2}
baz # => 2
```

Unlike erlang, elixir rebinds in patterns (weird). It is possible to prevent
this using the pin operator, `^`.

```elixir
[a, 2] = [1, 2]
[^a, 2] = [3, 2] # (MatchError)
```

## Functions

```elixir
print_name_egotistically = fn
    :rohan -> "Your name is Rohan!"
    _      -> "I don't care what your name is!"
end

print_name_egotistically.(:rohan) # => "Your name is Rohan!"
print_name_egotistically.(:cameron) # => "I don't care what your name is!"
```

## Case Statements

Elixir has case statements which seem fairly similar to in Elm:

```elixir
case {1,2,3} do
    {4,5,6} -> "No matches"
    {1,2,3} -> "This matches"
    {_,2,3} -> "This would match, but it isn't hit because above matches"
end
```
