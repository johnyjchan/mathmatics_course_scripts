
using Random
using Statistics
# Generator
Random.seed!(12)
z = [[cos(x*2.0*π/7)+0.2*rand() for x in 1:100] for i in 1:1000]
mean_loss_of_predicted_z_by_ß1 = mean([mean([abs(v[i]-v[i-1]) for i in 7:100]) for v in z])
mean_loss_of_predicted_z_by_ß2 = mean([mean([abs(v[i]-(2*v[i-1]-v[i-2])) for i in 7:100]) for v in z])
mean_loss_of_predicted_z_by_ß3 = mean([mean([abs(v[i]-v[i-6]) for i in 7:100]) for v in z])
mean_loss_of_predicted_z_by_ß4 = mean([mean([abs(v[i]-(v[i-1]+v[i-2])/2) for i in 7:100]) for v in z])

println(mean_loss_of_predicted_z_by_ß1)
println(mean_loss_of_predicted_z_by_ß2)
println(mean_loss_of_predicted_z_by_ß3)
println(mean_loss_of_predicted_z_by_ß4)







