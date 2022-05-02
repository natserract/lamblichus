
defmodule Lamblichus.Functor do
  @moduledoc """
    `Lamblichus` is a elixir macro for implemented functor way like in haskell

    Functors: uniform action over a parameterized type, generalizing the map function on lists.

    ## Usage
    You can define an Lamblichus Functor by calling `use Lamblichus.Functor` with a few
    options in your module.

    ```
    defmodule Stage.Init do
      # If you don't want to import a function or macro from `Kernel`,
      # use the `:except` option and then list the function/macro by arity:
      import Kernel, except: [<~>: 2, <|>: 2]

      use Lamblichus.Functor
    end
    ```

    You can now call the functor macro:
    ```
      functor (fn n -> n * 2 end), [1, 2, 3]
      (fn n -> n * 2 end) <~> [1, 2, 3]

      (functor (fn n -> n + 1 end), (fn n -> n * 2 end)).(8)
      ((fn n -> n + 1 end) <~> (fn n -> n * 2 end)).(8)

      functor_flipped [1, 2, 3], (fn n -> n + 1 end)
      [1, 2, 3] <|> fn n -> n + 1 end

      (functor_flipped (fn n -> n + 1 end), (fn n -> n * 2 end)).(8)
      ((fn n -> n + 1 end) <|> (fn n -> n * 2 end)).(8)
    ```
  """

  # Type Definitions
  # ----------------
  @typedoc "assume this type as your expected -,-"
  @type t :: any

  @typedoc "(a -> b) -> f a -> f b"
  @type f :: (term -> term)

  # Use Macro
  # ---------
  defmacro __using__(__opts__) do
    quote do
      import unquote(__MODULE__)
    end
  end

  @doc """
    A `Functor` is a type constructor which supports a mapping operation `map`

    `map` can be used to turn functions `a -> b` into functions
    `f a -> f b` whose argument and return types use the type constructor `f`
    to represent some computational context.

    * The law of identity
      `∀x. (id <$> x) ≅ x`

    * The law of composition
      `∀f g x.(f . g <$> x) ≅ (f <$> (g <$> x))`
  """
  @spec functor(t, f) :: t
  defmacro functor(func, val) do
    quote do
      case {unquote(func), unquote(val)} do
        {ff, fMap} when is_function(fMap, 1) ->
          fn arg ->
            if ff.(arg) do
              arg |> fMap.() |> ff.()
            end
          end

        {ff, map} when is_list(map) ->
          Enum.map(map, ff)

        {_, _} ->
          IO.warn("todo: functor#(this op) not yet implemented")
      end
    end
  end

  @doc """
    Flipped version of `functor`.
  """
  @spec functor_flipped(f, t) :: t
  defmacro functor_flipped(val, func) do
    quote do
      {map, ff} = {unquote(val), unquote(func)}
      functor ff, map
    end
  end

  # Well, elixir it's nice a language, we can using infix ops too
  # But, we can't define our own operators like in haskell
  #
  # We would either have to modify the Elixir parser directly (and recompile Elixir)
  # For more details @see https://github.com/elixir-lang/elixir/blob/1907914cf0d9d25b32373d3c8ad6b4b59877baaf/lib/elixir/src/elixir_parser.yrl#L73
  #
  # If you want to use this op from this module use the `:except` option
  #
  @doc """
    functor as <~>
  """
  def f <~> fa do
    functor f, fa
  end

  @doc """
    functor_flipped as <|>
  """
  def fa <|> f do
    functor_flipped fa, f
  end
end
