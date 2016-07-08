# Basics

## Atoms

Like symbols in ruby or clojure.

```elixir
:foo
:bar
:"can contain spaces if wrapped in quotes"
```

Name is value. Two atoms with same name are identical

```elixir
:foo == :foo
```

## Numbers

```elixir
1000000 == 1_000_000

1 + 2 # => 3
3 - 2 # => 1

4 / 10 # => 0.4
```
## Lists

Linked lists

```elixir
my_list = [:foo, :bar, :baz]

hd(my_list) # => :foo
tl(my_list) # => [:bar, :baz]
```


## Strings
There are two string formats in elixir: double-quoted strings, and single-quoted
strings.

Double-quoted strings are similar to those found in other programming languages.

Single-quoted strings are char lists

```elixir
"asdf" != 'asdf'
```

String interpolation is available in double-quote strings and is syntactically
similar to ruby.

```elixir
some_world = "Earth"
"Hello, #{some_world}!" # => "Hello, Earth!"
```

Single-quoted strings are just lists, and as a result you can perform many of
the same operations on them:

```elixir
hd('asdf') # => 97
tl('asdf') # => 'sdf'
```
As can be seen in this example, once a character code has been removed from the
string, it is represented as an integer.
## Tuples

Ordered

```elixir
{:foo, :bar, :baz}
```

## Keyword Lists

Key-Value pair

```elixir
[ foo: 1, bar: 2, baz: 3 ]
```

## Regex

```elixir
~r/foo.*/
```

## Boolean

All values are truthy except `false` and `nil` (shorthand for `:false` and
`:nil`)
