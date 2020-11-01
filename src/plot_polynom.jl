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

    #data to plot
    x = [x for x in -100:5:100];
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