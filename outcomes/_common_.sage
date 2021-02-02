import string

def checkit_cayley_table(
    group,
    labels=None,
    randomized=False,
    operator=r"\ast",
    operation=(lambda x,y: x*y),
):
    elements=group.list()
    if randomized:
        shuffle(elements)
    order=len(elements)
    if labels is None:
        labels = list(string.ascii_lowercase)[:order]
    latex_array = "\\begin{array}{c|" + ('c'*order) + "}\n"
    latex_array += operator + " & " + "&".join(labels) + "\\\\\\hline \n"
    for i in range(order):
        next_line=""
        if i>0:
            next_line += " \\\\ \n"
        next_line += labels[i]
        for e in elements:
            result = operation(elements[i],e)
#            print(elements[i])
#            print(e)
#            print(product)
#            print(elements.index(product))
#            print(labels)
#            print(labels[elements.index(product)])
#            print()
            label = labels[elements.index(result)]
            next_line += " & "+label
        latex_array += next_line
    latex_array += "\n\\end{array}"
    return latex_array
