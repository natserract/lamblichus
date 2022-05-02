defmodule Operator do
  @doc """
    Functor operator haskell
  """

  # Type Definitions
  # ----------------
  @typedoc "Any type for functor"
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
end
