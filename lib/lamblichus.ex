defmodule Lamblichus.Test do
  use Lamblichus.Functor

  def main do
    flipped = functor_flipped([1, 2, 3], fn n -> n + 1 end)
    IO.inspect(flipped)
  end
end

defmodule Lamblichus do
  def main do
    Lamblichus.Test.main()
  end
end

# Elix.loop(["asd", 2])
Lamblichus.main()

# ms =
#   start("lowercase")
#   .pipe(to_uppercase)
#   .pipe(to_capitalize)

# Create functor operator
# References: https://shane.logsdon.io/writing/functors-applicatives-and-monads-in-elixir/
# https://hexdocs.pm/elixir/Module.html#module-compile-callbacks
# https://coder-question.com/cq-blog/318128
# https://brooklinmyers.medium.com/using-use-usefully-in-elixir-and-phoenix-b59a5ea08ad2
