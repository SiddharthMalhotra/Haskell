fibFast n =
  let fib = 0:1:zipWith (+) fib (tail fib)
  in fib!!n