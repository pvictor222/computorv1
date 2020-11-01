import Base.parse

#=
    Prints the reduced form of the polynom using the "reduced" dictionnary
=#
function print_reduced(reduced)
    key_set = [key for key in keys(reduced)]
    print("Reduced form: ")
    for key in 2:length(key_set)
        print(" + $(key_set[key]) ")
    end
    println()
end

#=
    Prints the degree of the polynom
=#
function print_degree(reduced)
    key_set = []
    valid = 1
    max_degree = 0
    key_set = [key for key in keys(reduced)]
    for key in 1:length(key_set)
        temp = key_set[key]
        println(temp)
        if (temp > max_degree)
            max_degree = temp
        end
        if (temp < 0 || round(temp) != temp)
            valid = -1
        end
    end
    if (valid == -1)
        println("Polynoms must only be X^0, X^1 or X^2. I can't solve.")
    elseif (max_degree > 2)
        println("Polynomial degree: $(Int(max_degree))")
        println("The polynomial degree is stricly greater than 2, I can't solve.")
    end
    return (max_degree, valid)
end