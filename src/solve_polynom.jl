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
    println(-b/a == round(-b/a) ? Int(-b/a) : (round(-b/a, digits=4)))
end

#=
    delta = b^2 - 4 * a * c
    1. if delta < 0 => 0 real solution
    2. if delta = 0 => 1 solution = -b / (2 * a)
    3. if delta > 0 => 2 solutions : 
        x1 = (-b - delta^(1/2)) / (2 * a)
        x2 = (-b + delta^(1/2)) / (2 * a)
=#
function solve_2(reduced)
    a = reduced[2]
    b = haskey(reduced, 1) == true ? reduced[1] : 0
    c = haskey(reduced, 0) == true ? reduced[0] : 0
    delta = b ^ 2 - 4 * a * c
    println("Do you want to print the discriminant? (yes/no)")
    verbose = readline()
    if (verbose != "" && lowercase(verbose) == "yes")
        println("Delta = $delta")
    end
    if (delta < 0)
        println("The discriminant is strictly negative, there is no solution among real numbers. However, there are two complex solutions:")
        x1 = (-b - Complex(delta)^(1/2)) / (2 * a)
        x2 = (-b + Complex(delta)^(1/2)) / (2 * a)
        println("x1 = $(round(x1, digits=4))")
        println("x2 = $(round(x2, digits=4))")
    elseif (delta == 0)
        x1 = -b / (2 * a)
        println("The discriminant is null, the solution is:")
        println(x1)
    else
        x1 = (-b - delta^(1/2)) / (2 * a)
        x2 = (-b + delta^(1/2)) / (2 * a)
        println("The discriminant is strictly positive, the two solutions are:")
        println("x1 = $(round(x1, digits=4))")
        println("x2 = $(round(x2, digits=4))")
    end
end

#=
    Send to the different functions depending on the polynom degree
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