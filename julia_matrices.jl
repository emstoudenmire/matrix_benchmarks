using LinearAlgebra
using BenchmarkTools
using Printf

#= Results

CPU   BLAS   n     m     k     FLOPS
M1    MKL    200   200   200   2.31E10
M1    MKL    400   400   400   2.34E10
M1    MKL    800   800   800   2.34E10
Xeon  MKL    400   400   400   9.6912E+10
Xeon  MKL    800   800   800   1.0067E+11


Processor Notes:
- I think the M1 is a 3.2 GHz processor (single performance core speed)
- Xeon chip is a 3.6 GHz Intel Xeon Gold 6244
- Using max FLOPS of 32*(processor frequency) gives
  > M1: 9.92E10
  > Xeon: 1.152E11

=#

let
  @show BLAS.get_config()
  BLAS.set_num_threads(1)
  @show BLAS.get_num_threads()

  N = 800

  n = N
  m = N
  k = N

  A = randn(m,k)
  B = randn(k,n)

  T = @benchmark begin
    A = randn($m,$k)
    B = randn($k,$n)
    #C = $A * $B
    C = A * B
  end
  display(T)

  t = time(T)*1E-9

  F = n*m*(2k-1)

  flops = F/t

  @printf("FLOPS = %.4E\n",flops)

  return
end
