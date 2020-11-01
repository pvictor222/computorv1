#=
    Splits by "-"
    Removes blank spaces before and after strings
    Add "-" in front of all the strings (except the first one)
    Remove the first element if empty
=#
function split_negative(str)
    array = split(str, "-")
    for i in 1:length(array)
        array[i] = rstrip(lstrip(array[i]))
    end
    for i in 2:length(array)
        array[i] = "-"*array[i]
    end
    if (array[1] == "")
        popfirst!(array)
    end
    return (array)
end

#=
    Splits by "+"
    Removes blank spaces before and after strings
    Remove the first element if empty
=#
function split_positive(array)
    array_return = []
    for i in 1:length(array)
        array_return = vcat(array_return, split(array[i], "+"))
    end
    for i in 1:length(array_return)
        array_return[i] = rstrip(lstrip(array_return[i]))
    end
    if (array_return[1] == "")
        popfirst!(array_return)
    end
    return (array_return)
end

#=
    Split by "=", then "-" and "+"
    Returns arrays for left and right sides
=#
function parse_argv(arg)
    left = split(arg, "=")[1]
    right = split(arg, "=")[2]
    left_array = split_negative(left)
    right_array = split_negative(right)
    left_array = split_positive(left_array)
    right_array = split_positive(right_array)
    return(left_array, right_array)
end
