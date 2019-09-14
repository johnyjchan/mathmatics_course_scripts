
using Random
using Statistics
# Generator
Random.seed!(1)
# x = [9+2*rand() for _ in 1:100]
x = [9+2/99*(i-1) for i in 1:100]
# randomly pick up the scalar a within interval (9,11)
minimizer = 9+2*rand()
learning_rate = 0.01
# partial derivative function of a
function partial_derivative_func(a)
    return (-2*sum(x)+200*a)/(2*sqrt(sum([(i-a)^2 for i in x])))
end
# iteratively convergence to minimizer
println("initial minimizer: ", minimizer)
function convergence_to_minimizer(minimizer, learning_rate)
    for _ in 1:100
        minimizer -= learning_rate * partial_derivative_func(minimizer)
    end
    return minimizer
end
# evaluate different learning rate in this case
performance = [(learning_rate*i,abs(convergence_to_minimizer(minimizer, learning_rate*i)-mean(x))) for i in 1:100]
best_learning_rate = sort(performance, by = last, rev = false)[1:20]





