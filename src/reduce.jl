
import Base.parse

#=
    Inputs :
        1. array = an array of the numbers on the side of the equation
        2. side = a string indicating which side we're working on
=#
function reduce(array, side, reduced)
    for i in 1:length(array)
        temp = split(array[i], "* X^")
        x = Base.parse.(Float64, String(rstrip(lstrip(temp[1]))))
        if (side == "left")
            if haskey(reduced, Base.parse.(Float64, String(rstrip(lstrip(temp[2])))))
                reduced[Base.parse.(Float64, String(rstrip(lstrip(temp[2]))))] += x
            else
                push!(reduced, Base.parse.(Float64, String(rstrip(lstrip(temp[2])))) => x)
            end
        else
            if haskey(reduced, Base.parse.(Float64, String(rstrip(lstrip(temp[2])))))
                reduced[Base.parse.(Float64, String(rstrip(lstrip(temp[2]))))] -= x
            else
                push!(reduced, Base.parse.(Float64, String(rstrip(lstrip(temp[2])))) => -x)
            end
        end
    end
end