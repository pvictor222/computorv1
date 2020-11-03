import Base.parse

#=
    Removes all the keys with a 0 value (only if more than 2 keys)
=#
function clean_reduced(reduced)
    if (length(reduced) >= 2)
        key_set = sort([key for key in keys(reduced)])
        for key in key_set
            if (reduced[key] == 0)
                pop!(reduced, key)
            end
        end
    end
end

#=
    Prints the reduced form of the polynom using the "reduced" dictionnary
        1. Call clean_reduced(reduced) to remove the keys with a 0 value
        2. Get all the keys
        3. If the decimals are 0, removes them
        4. For each key, prints "+" (if not the first term) or "-" then "a * X^key"
=#
function print_reduced(reduced)
    clean_reduced(reduced)
    key_set = sort([key for key in keys(reduced)])
    print("Reduced form: ")
    for key in key_set
        reduced[key] >= 0 ? (findfirst(isequal(key), key_set) != 1 ? print(" + ") : print("")) : print(" - ")
        temp_power = (key == round(key)) ? Int(round(key)) : key
        temp_key = (abs(reduced[key]) == round(abs(reduced[key]))) ? Int(round(abs(reduced[key]))) : abs(reduced[key])
        print("$temp_key * X^$temp_power")
    end
    println(" = 0")
end

#=
    Prints the degree of the polynom, and checks if the degrees are all valid
    --> Returns:
        valid = 1 if OK, -1 if KO
        max_degree = highest degree recorded
=#
function print_degree(reduced)
    key_set = []
    valid = 1
    max_degree = 0
    key_set = [key for key in keys(reduced)]
    for key in 1:length(key_set)
        temp = key_set[key]
        if (temp > max_degree)
            max_degree = temp
        end
        if (temp < 0 || round(temp) != temp)
            valid = -1
        end
    end
    println("Polynomial degree: $(abs(max_degree) == round(abs(max_degree)) ? Int(max_degree) : max_degree)")
    if (valid == -1)
        println("Polynoms must only be X^0, X^1 or X^2. I can't solve.")
    elseif (max_degree > 2)
        println("The polynomial degree is stricly greater than 2, I can't solve.")
    end
    return (max_degree, valid, max_degree)
end