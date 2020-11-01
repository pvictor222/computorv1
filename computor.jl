include("src/check_args.jl")
include("src/check_polynom.jl")
include("src/solve_polynom.jl")
include("src/plot_polynom.jl")

#=
    1. Check the number of args
    2. Check that the args are proper
    3. Send to check_polynom()
        ==> ret[1] = 1 if valid, otherwise -1
        ==> ret[2] = reduced (the reduced polynom)
        ==> ret[3] = max_degree
    4. Asks the user, if "yes" send to plot_polynom() to visualize
=#

if (ARGS == "")
    println("""You need to enter one argument. Please enter a polynomial function of the form:\n"a * X^0 + b * X^1 + c * X^2" """)
elseif (check_args(ARGS) == 1)
    ret = check_polynom(ARGS[1])
    if (ret[1] == 1)
        solve_polynom(ret[2], ret[3])
    end
    println("Do you want to plot the data?")
    visualize = readline()
    if (lowercase(visualize) == "yes")
        plot_polynom(ret[2])
    end
end