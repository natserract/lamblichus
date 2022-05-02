
defmodule Lamblichus.Functor do
  @doc """
    Functor operator haskell

    * The law of identity
      `∀x. (id <$> x) ≅ x`

    * The law of composition
      `∀f g x.(f . g <$> x) ≅ (f <$> (g <$> x))`
  """

  # Type Definitions
  # ----------------
  @typedoc "assume this type as your expected -,-"
  @type t :: any

  @typedoc "(a -> b) -> f a -> f b"
  @type f :: (term -> term)

  defmacro __using__(__opts__) do
    quote do
      import unquote(__MODULE__)
    end
  end

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
