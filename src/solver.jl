include("parser.jl")

#=
    Sent to "parse()" to get polynom
    --> polynom = dict("X0" => "a", "X1" => "b", "X2" => "c")
    
=#
function solve_polynom(ARGS)
    array = parse(ARGS)
    left = array[1]
    right = array[2]
    println("In solve_polynom")
    println(left)
    println(right)
end