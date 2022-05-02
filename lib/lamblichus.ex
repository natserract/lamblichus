defmodule Lamblichus do
  use Lamblichus.Functor

  def main do
    functorList = functor (fn n -> n * 2 end), [1, 2, 3]

    functorFn = functor (fn n -> n + 1 end), (fn n -> n * 2 end)
    callFunctorFn = functorFn.(8)

    # Functor flipped
    flippedList = functor_flipped [1, 2, 3], (fn n -> n + 1 end)
    flippedFn = functor_flipped (fn n -> n + 1 end), (fn n -> n * 2 end)
    callFlippedFn = flippedFn.(8)

    IO.inspect(functorList)
    IO.inspect(callFunctorFn)

    IO.inspect(flippedList)
    IO.inspect(callFlippedFn)
  end
end

Lamblichus.main()
