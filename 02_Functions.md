# Functions

## Defining Anonymous Functions

```elixir

print_name = fn
    {:person, first_name, last_name} -> first_name <> " " <> last_name
end

print_name.({ :person, "Rohan", "Orton" }) # => "Rohan Orton"
print_name.(1234) # (FunctionClauseError)
```

## Immediately invoke functions:

```elixir
(fn -> "Foo!" end).() # => "Foo!"
```

## Functions are first class types:

Functions can be passed about as data
