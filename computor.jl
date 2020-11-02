include("src/check_args.jl")
include("src/check_polynom.jl")
include("src/solve_polynom.jl")
include("src/plot_polynom.jl")

#=
    1. Check that there is an argument, otherwise asks for user input
    2. Send to check_polynom()
        ==> ret[1] = 1 if valid, otherwise -1
        ==> ret[2] = reduced (the reduced polynom)
        ==> ret[3] = max_degree
    3. Asks the user, if "yes" send to plot_polynom() to visualize (only if valid and max_degree = 2)
=#

if (length(ARGS) < 1 || ARGS[1] == "")
    println("Please enter a polynomial function of the form: 'a * X^0 + b * X^1 + c * X^2'")
    input = readline()
else
    input = ARGS[1]
end
if (input != "")
    ret = check_polynom(input)
    if (ret[1] == 1)
        solve_polynom(ret[2], ret[3])
        if (ret[3] <= 2)
            println("Do you want to plot the data? (yes/no)")
            visualize = readline()
            if (visualize != "" && lowercase(visualize) == "yes")
                plot_polynom(ret[2])
            end
        end
    end
end