defmodule Lamblichus do
  # If you don't want to import a function or macro from `Kernel`,
  # use the `:except` option and then list the function/macro by arity:
  import Kernel, except: [<~>: 2, <|>: 2]

  use Lamblichus.Functor

  @spec fmap(any, any) :: :ok | (any -> any) | list
  defdelegate fmap(t, f), to: Lamblichus.Functor, as: :functor

  @spec flip(any, any) :: :ok | (any -> any) | list
  defdelegate flip(f, t), to: Lamblichus.Functor, as: :functor_flipped
end
