import Base.parse

#=
    Checks if the value is numeric
=#
function is_string_digit(str)
    value = 1
    for i in 1:length(str)
        if (isdigit(str[i]) == false && str[i] != '-')
            value = -1
        end
    end
    return (value)
end

#=
    Adds the key and value to the dictionnary.
    Checks that the key does exist, otherwise push the value
    Subtracts if right, adds if left.
=#
function add_to_dict(value, key, side, reduced)
    if (side == "left")
        if haskey(reduced, key)
            reduced[key] += value
        else
            push!(reduced, key => value)
        end
    else
        if haskey(reduced, key)
            reduced[key] -= value
        else
            push!(reduced, key => -value)
        end
    end
end

#=
    Inputs :
        1. array = an array of the numbers on the side of the equation
        2. side = a string indicating which side we're working on
        3. reduced = the dictionnary where we'll add the variables
    Parsing :
        1. If there is no "* X^"
            - Either a single number to add to X^0
            - Or a X^1. If no number, it's a 1.
        2. Else, we split and parse. If no number, it's a 1.
    Numbers from the right side are subtracted and the left side is added
=#
function reduce(array, side, reduced)
    for i in 1:length(array)
        if (occursin("X^", array[i]) == false)
                if (is_string_digit(strip(lstrip(array[i]))) == 1)
                add_to_dict(Base.parse.(Float64, String(strip(lstrip(array[i])))), 0, side, reduced)
            else
                if (occursin("* X", array[i]) == true || occursin("*X", array[i]) == true)
                    temp = split(array[i], "*")
                    add_to_dict(Base.parse.(Float64, String(strip(lstrip(temp[1])))), 1, side, reduced)
                else
                    add_to_dict(1, 1, side, reduced)
                end
            end
        else
            if (occursin("*", array[i]) == false)
                temp = split(array[i], "X^")
                add_to_dict(Base.parse.(Float64, String(rstrip(lstrip(temp[1])))), Base.parse.(Float64, String(rstrip(lstrip(temp[2])))), side, reduced)
            else
                if (occursin("* X^", array[i]) == true)
                    temp = split(array[i], "* X^")
                else
                    temp = split(array[i], "*X^")
                end
                x = Base.parse.(Float64, String(rstrip(lstrip(temp[1]))))
                add_to_dict(x, Base.parse.(Float64, String(rstrip(lstrip(temp[2])))), side, reduced)
            end
        end
    end
end