
using LinearAlgebra

# Trapezoid rule
n1 = 2
t1 = [-1 1]
w1 = [1/2 1/2]
# Simpson's rule
n2 = 3
t2 = [-1 0 1]
w2 = [1/3 4/3 1/3]
# Simpson's 3/8 rule
n3 = 4
t3 = [-1 -1/3 1/3 1]
w3 = [1/4 3/4 3/4 1/4]

f(t) = sin(t)/t
alpha(n,t,w) = sum([w[i]*f(t[i]) for i in 1:n])
# use Talyor estimate
F(t) = t-t^3/(3*(1+2+3))+t^5/(5*(1+2+3+4+5))-t^7/(7*(1+2+3+4+5+6+7))+t^9/(9*(1+2+3+4+5+6+7+8+9))+t^11/(11*(1+2+3+4+5+6+7+8+9+10+11))
actual_alpha = F(1) - F(-1)
println(actual_alpha)
# use Quadratuer_method
println(alpha(n1,t1,w1))
println(alpha(n2,t2,w2))
println(alpha(n3,t3,w3))

# outperforms rule
n4 = 10
t4 = [-1 -4/5 -3/5 -2/5 -1/5 1/5 2/5 3/5 4/5 1]
w4 = [1/15 2/15 3/15 4/15 5/15 5/15 4/15 3/15 2/15 1/15]
println(actual_alpha)
println(alpha(n1,t1,w1))
println(alpha(n2,t2,w2))
println(alpha(n3,t3,w3))
println(alpha(n4,t4,w4))


