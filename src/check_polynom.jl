include("parser.jl")
include("reduce.jl")
include("print_reduced.jl")

#=
    Checks each char in the string to see if they are legit 
=#
function check_chars(string)
    valid = 1
    for i in string
        valid = (occursin(i, "012345678-+=* X^") == true) ? valid : -1
    end
    if (valid == -1)
        println("Wrong characters have been detected. Please enter a polynomial function of the form: 'a * X^0 + b * X^1 + c * X^2'")
    end
    return (valid)
end

#=
    Send to "parse()" to get "left" and "right", which are arrays with all the terms
    Send them to "reduce()" to get the reduced form in a dictionnary : 
        reduced = dict("X2" => a, "X1" => b, "X0" => c)
=#
function check_polynom(ARGS)
    valid = check_chars(ARGS)
    max_degree = -1
    reduced = Dict()
    if (valid == 1)
        array = parse_argv(ARGS)
        left = array[1]
        right = array[2]
        reduce(left, "left", reduced)
        reduce(right, "right", reduced)
        print_reduced(reduced)
        temp = print_degree(reduced)
        degree = temp[1]
        valid = temp[2]
        max_degree = temp[3]
    end
    return (valid, reduced, max_degree)
end