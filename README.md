# Elix

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `elix` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:elix, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/elix>.


Haskell ways:
```hs
~ (+1) <$> [1, 2, 3, 4]
-- Output: [2, 3, 4, 5]

~ (\x -> Just x) <$> [1, 2, 3, 4, 5]
-- Output: [Just 1,Just 2,Just 3,Just 4,Just 5]

~ ((\a -> a + 1) <$> (\b -> b * 2)) 8
-- Output: 17
```