include("src/checks.jl")
include("src/solver.jl")

if (ARGS == "")
    println("""You need to enter one argument. Please enter a polynomial function of the form:\n"a * X^0 + b * X^1 + c * X^2" """)
elseif (check_args(ARGS) == 1)
    println("On va s'occuper de ce polynome")
    solve_polynom(ARGS[1])
end