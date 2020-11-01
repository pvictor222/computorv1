include("parser.jl")
include("reduce.jl")
include("print_reduced.jl")

#=
    Send to "parse()" to get "left" and "right", which are arrays with all the terms
    Send them to "reduce()" to get the reduced form in a dictionnary : 
        reduced = dict("X2" => a, "X1" => b, "X0" => c)
=#
function solve_polynom(ARGS)
    array = parse_argv(ARGS)
    left = array[1]
    right = array[2]
    reduced = Dict()
    reduce(left, "left", reduced)
    reduce(right, "right", reduced)
    println(reduced)
    print_reduced(reduced)
    temp = print_degree(reduced)
    degree = temp[1]
    valid = temp[2]
    if (indexin(degree, [0, 1, 2]) > 0)
        println("Polynom de degré correct")
    end
end