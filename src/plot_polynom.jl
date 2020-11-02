# To install Plots
#   using Pkg
#   Pkg.add("Plots")
using Plots, Dates

#=
    Plot the polynom using the reduced form.
    Ask the user for left and right limits and the padding.
    Plot and save as pdf file on the desktop
=#
function plot_polynom(reduced)
    a = haskey(reduced, 2) == true ? reduced[2] : 0
    b = haskey(reduced, 1) == true ? reduced[1] : 0
    c = haskey(reduced, 0) == true ? reduced[0] : 0
    a = (a == round(a)) ? Int(a) : a
    b = (b == round(b)) ? Int(b) : b
    c = (c == round(c)) ? Int(c) : c

    # Ask the user for the limits, padding and format
    println("What is the left limit on the x-axis? (-100 if no input)")
    limit_left = readline()
    limit_left = (limit_left == "" || is_string_digit(limit_left) == -1) ? "-100" : limit_left
    println("What is the right limit on the x-axis? (100 if no input)")
    limit_right = readline()
    limit_right = (limit_right == "" || is_string_digit(limit_right) == -1) ? "100" : limit_right
    println("What is the padding? (5 if no input)")
    padding = readline()
    padding = (padding == "" || is_string_digit(padding) == -1) ? "5" : padding
    println("Do you want to save the plot as PDF of PNG? PDF is by default. (PDF/PNG)")
    format = readline()
    format = (format != "" && lowercase(format) == "png") ? "png" : "pdf"
    
    # Check the limits : left > right, or error
    valid = Base.parse.(Float64, limit_left) < Base.parse.(Float64, limit_right) ? 1 : -1
    # Check the padding : should be within the right - left range, or error
    valid = Base.parse.(Float64, padding) < (Base.parse.(Float64, limit_right) - Base.parse.(Float64, limit_left)) ? valid : -2

    if (valid == 1)
        # Create the data to plot
        x = [x for x in Base.parse.(Float64, limit_left):Base.parse.(Float64, padding):Base.parse.(Float64, limit_right)];
        y = [a * (i^2) + b * i + c for i in x];
        println(x)
        println(y)

        # Use GR module for background
        gr();
        
        # Plot the axis
        plot(x, y, label="y = $a*x^2 + $b*x + $c")
        
        # Save the plot on the Desktop in pdf format
        savefig("~/Desktop/plot$(Dates.format(now(), "HH:MM:SS")).$format")
    elseif (valid == -1)
        println("I can't plot this: the left limit should be lower than the right limit.")
    else
        println("I can't plot this: the padding should be within the range of the left and right limits.")
    end
end