load("_common_.sage")
def generator():
    group = SymmetricGroup(3)
    nongroup = Integers(6)
    labels = [
        ["a","b","c","d","f","g"],
        ["2","4","6","8","10","12"],
    ]
    shuffle(labels)
    operators = ["\\cdot","\\circ"]
    shuffle(operators)
    tables = [
        checkit_cayley_table(group,randomized=True,labels=labels[0],operator=operators[0]),
        checkit_cayley_table(nongroup,randomized=True,labels=labels[1],operator=operators[1]),
    ]
    shuffle(tables)
    primes = [11,13,17,19]
    nonprimes = [12,14,16,18]

    return {
        "tables": tables,
        "prime": choice(primes),
        "nonprime": choice(nonprimes),
    }
