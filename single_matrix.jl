using LinearAlgebra
using BenchmarkTools
using Printf

let
  @show BLAS.get_config()
  BLAS.set_num_threads(1)
  @show BLAS.get_num_threads()

  N = 3_000

  n = N
  m = N
  k = N

  A = randn(m,k)
  B = randn(k,n)

  C = A * B

  return
end
