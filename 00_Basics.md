# Basics

## Atoms

Like symbols in ruby or clojure.

```elixir
:foo
:bar
:"can contain spaces if wrapped in quotes"
```

## Numbers

```elixir
1000000 == 1_000_000

1 + 2 # => 3

4 / 10 # => 0.4


```

# Lists

Linked lists

```elixir
my_list = [:foo, :bar, :baz]

hd(my_list) # => :foo
tl(my_list) # => [:bar, :baz]
```

# Tuples

Ordered

```elixir
{:foo, :bar, :baz}
```

# Keyword Lists

Key-Value pair

```elixir
[ foo: 1, bar: 2, baz: 3 ]
```

# Regex

```elixir
%r/foo.*/
```

# Boolean

All values are truthy except `false` and `nil` (shorthand for `:false` and
`:nil`)
