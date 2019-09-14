
using GR
using LinearAlgebra

image = [(i+j)^2 for i in 1:10, j in 1:10]
A = [ i+j == 11 ? 1 : 0 for i in 1:10 , j in 1:10]
# upside-down
y_upsidedown = A*image
heatmap(y_upsidedown, yflip = true)
# rotate 90
y_rotate_90 = transpose(image)*A
heatmap(y_rotate_90, yflip = true)
# produce shifing matrix
i = Matrix{Float64}(I, 8, 8)
zeros_row = transpose(zeros(8))
A_shifting_up = vcat(i,zeros_row,zeros_row)
A_shifting_upright = hcat(zeros(10),zeros(10),A_shifting_up)
y_upright2pix = A_shifting_upright*image*A_shifting_upright
heatmap(y_upright2pix, yflip = true)
# construct neighbours's mean
image_mean = [(image[i+1,j]+image[i-1,j]+image[i,j-1]+image[i,j+1])/4 for i in 2:9 , j in 2:9]
image_top = [(image[i+1,1]+image[i-1,1]+image[i,2])/3 for i in 2:9]
image_bottom = [(image[i+1,10]+image[i-1,10]+image[i,9])/3 for i in 2:9]
image_mean = vcat(transpose(image_top),image_mean,transpose(image_bottom))
image_left = append!([(image[1,2]+image[2,1])/2], [(image[1,j+1]+image[1,j-1]+image[2,j])/3 for j in 2:9])
image_left = append!(image_left, [(image[1,9]+image[2,10])/2])
image_right = append!([(image[10,2]+image[9,1])/2], [(image[10,j+1]+image[10,j-1]+image[9,j])/3 for j in 2:9])
image_right = append!(image_right, [(image[10,9]+image[9,10])/2])
y_mean = hcat(image_left, image_mean, image_right)
heatmap(y_mean, yflip = true)


