#include "itensor/all.h"
#include "itensor/util/print_macro.h"
#include <chrono>
using namespace itensor;

using clock_type = std::chrono::steady_clock;

int main()
    {
    int N = 3000;
    int Npass = 1;

    int m = N;
    int n = N;
    int k = N;


    auto start = clock_type::now();
    for(auto p : range1(Npass))
        {
        auto A = randomMat(m,k);
        auto B = randomMat(k,n);
        auto C = A*B;
        }
    auto end = clock_type::now();

    auto dn = std::chrono::duration_cast<std::chrono::nanoseconds>(end-start);
    println("dn = ",dn.count()/Npass);
    auto d = std::chrono::duration<double, std::milli>(end-start).count();
    d /= Npass;
    printfln("d = %.12f",d);

    return 0;
    }
