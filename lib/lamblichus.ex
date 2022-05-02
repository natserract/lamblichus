defmodule Lamblichus do
  # If you don't want to import a function or macro from `Kernel`,
  # use the `:except` option and then list the function/macro by arity:
  import Kernel, except: [<~>: 2, <|>: 2]

  use Lamblichus.Functor

  def main do
    functorList = functor (fn n -> n * 2 end), [1, 2, 3]
    functorListOp = (fn n -> n * 2 end) <~> [1, 2, 3]

    functorFn = (functor (fn n -> n + 1 end), (fn n -> n * 2 end)).(8)
    functorFnOp = ((fn n -> n + 1 end) <~> (fn n -> n * 2 end)).(8)

    flippedList = functor_flipped [1, 2, 3], (fn n -> n + 1 end)
    flippedListOp = [1, 2, 3] <|> fn n -> n + 1 end

    flippedFn = (functor_flipped (fn n -> n + 1 end), (fn n -> n * 2 end)).(8)
    flippedFnOp = ((fn n -> n + 1 end) <|> (fn n -> n * 2 end)).(8)

    IO.inspect(functorList)
    IO.inspect(functorListOp)

    IO.inspect(functorFn)
    IO.inspect(functorFnOp)

    IO.inspect(flippedList)
    IO.inspect(flippedListOp)

    IO.inspect(flippedFn)
    IO.inspect(flippedFnOp)
  end
end

Lamblichus.main()
