#=
    No solutions if a != 0
    Otherwise all numbers are solutions
=#
function solve_0(reduced)
    if (reduced[0] == 0)
        println("All numbers are solutions.")
    else
        println("There is no solution.")
    end
end

#=
    ax + b = 0 <=> x = -b / a
=#
function solve_1(reduced)
    a = reduced[1]
    b = haskey(reduced, 0) == true ? reduced[0] : 0
    println("The solution is:")
    println(-b/a == round(-b/a) ? Int(-b/a) : -b/a)
end

#=

=#
function solve_2(reduced)
    println("In solve_2")
end

#=

=#
function solve_polynom(reduced, max_degree)
    if (max_degree == 0)
        solve_0(reduced)
    elseif (max_degree == 1)
        solve_1(reduced)
    elseif (max_degree == 2)
        solve_2(reduced)
    end
end