# Lamblichus

Lamblichus is a **elixir [macro](https://elixir-lang.org/getting-started/meta/macros.html)** for implemented functor way like in haskell

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `lamblichus` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:lamblichus, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/lamblichus>.


Haskell ways:
```hs
~ (+1) <$> [1, 2, 3, 4]
-- Output: [2, 3, 4, 5]

~ (\x -> Just x) <$> [1, 2, 3, 4, 5]
-- Output: [Just 1,Just 2,Just 3,Just 4,Just 5]

~ ((\a -> a + 1) <$> (\b -> b * 2)) 8
-- Output: 17

~ ((\a -> a + 1) <&> (\b -> b * 2)) 8
-- Output: 18
```

## Example: 

```ex
~ functor (fn n -> n * 2 end), [1, 2, 3] # Output: [2, 4, 6]
~ (fn n -> n * 2 end) <~> [1, 2, 3] # Output: [2, 4, 6]

~ (functor (fn n -> n + 1 end), (fn n -> n * 2 end)).(8) # Output: [17]
~ ((fn n -> n + 1 end) <~> (fn n -> n * 2 end)).(8) # Output: [17]

~ functor_flipped [1, 2, 3], (fn n -> n + 1 end) # Output: [2, 3, 4]
~ [1, 2, 3] <|> fn n -> n + 1 end # Output: [2, 3, 4]

~ (functor_flipped (fn n -> n + 1 end), (fn n -> n * 2 end)).(8) # Output: [18]
~ ((fn n -> n + 1 end) <|> (fn n -> n * 2 end)).(8) # Output: [18]
```

## References:
- [https://shane.logsdon.io/writing/functors-applicatives-and-monads-in-elixir/](https://shane.logsdon.io/writing/functors-applicatives-and-monads-in-elixir/)
- [https://hexdocs.pm/elixir/Module.html#module-compile-callbacks](https://hexdocs.pm/elixir/Module.html#module-compile-callbacks)
- [https://coder-question.com/cq-blog/318128](https://coder-question.com/cq-blog/318128)
- [https://brooklinmyers.medium.com/using-use-usefully-in-elixir-and-phoenix-b59a5ea08ad2](https://brooklinmyers.medium.com/using-use-usefully-in-elixir-and-phoenix-b59a5ea08ad2)
- [https://github.com/elixir-lang/elixir/blob/main/lib/elixir/src/elixir_parser.yrl](https://github.com/elixir-lang/elixir/blob/main/lib/elixir/src/elixir_parser.yrl)