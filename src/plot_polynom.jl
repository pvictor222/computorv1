# To install Plots
#   using Pkg
#   Pkg.add("Plots")
#   Pkg.add("UnicodePlots")
using Plots, Dates
#using UnicodePlots

#=

=#
function plot_polynom(reduced)
    a = haskey(reduced, 2) == true ? reduced[2] : 0
    b = haskey(reduced, 1) == true ? reduced[1] : 0
    c = haskey(reduced, 0) == true ? reduced[0] : 0

    a = (a == round(a)) ? Int(a) : a
    b = (b == round(b)) ? Int(b) : b
    c = (c == round(c)) ? Int(c) : c

    # Ask the user for the limits
    println("What is the left limit on the x-axis? (-100 if no input)")
    limit_left = readline()
    limit_left = (limit_left == "" || is_string_digit(limit_left) == -1) ? "-100" : limit_left
    println("What is the right limit on the x-axis? (100 if no input)")
    limit_right = readline()
    limit_right = (limit_right == "" || is_string_digit(limit_right) == -1) ? "100" : limit_right
    println("What is the padding? (5 if no input)")
    padding = readline()
    padding = (padding == "" || is_string_digit(padding) == -1) ? "5" : padding

    # data to plot
    x = [x for x in Base.parse.(Float64, limit_left):Base.parse.(Float64, padding):Base.parse.(Float64, limit_right)];
    y = [a * (i^2) + b * i + c for i in x];
    println(x)
    println(y)

    #use GR module
    gr();
    
    #plot
    plot(x, y, label="y = $a*x^2 + $b*x + $c")
    #add points
    # scatter!(x, y, label="points")
    
    #save plot
    savefig("~/Desktop/plot$(Dates.format(now(), "HH:MM:SS")).png")
end