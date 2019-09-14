
using LinearAlgebra
using StatsBase
a_generator(length, index) = [ i <= index ? 1 : 0 for i in 1:length]
k = 10
a = [a_generator(k, i) for i in 1:k]
# generate non_trivial permutation of a
a = sample(a, k, replace = false)
# println(a) 
function Gram_Schmidt_process(a)
    q = [a[1] / norm(a[1])]
    for i in 2:length(a)
        temp = a[i]
        for j in 1:i-1
            temp = temp - q[j]'*a[i]*q[j]
        end
        # check if linear dependent, null vector is the only dependent vector.
        count_zero = 0
        for var in temp
            if var == 0
                count_zero += 1
            end
        end
        if count_zero == length(temp)
            return false
        end
        # Normalization
        temp = temp / norm(temp)
        push!(q, temp )
    end
    return q
end
Gram_Schmidt_process(a)
#test_negative = [[1,2], [2,4]]
#Gram_Schmidt_process(test_negative)




