#=
    Checks that there is only one argument.
    If so, sends to check_polynom() to check that the polynom is good.
    Returns : 
        --> the splitted array
        --> -1 if there's an error
=#
function check_args(ARGS)
    if (length(ARGS) > 1)
        println("""You entered too many arguments. Please enter a polynomial function of the form: "a * X^0 + b * X^1 = c * X^2" """)
        return (-1)
    else
        return (1)
    end
end