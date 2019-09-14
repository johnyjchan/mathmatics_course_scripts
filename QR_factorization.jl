
using LinearAlgebra
using StatsBase
n = 5
k = 5
A = [ x-y >=0 ? 1 : 0 for x in 1:k , y in 1:n]
Q,R = qr(A)
Q1,R1 = qr(A[1:k-1,1:n])
Q2,R2 = qr(A[1:k-2,1:n])
Q3,R3 = qr(A[1:k-3,1:n])
Q4,R4 = qr(A[1:k-4,1:n])
Q*R

Q1*R1

Q2*R2

Q3*R3

Q4*R4


