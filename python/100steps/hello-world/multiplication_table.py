def print_table(number=5, start=1, to=10):
    for i in range(start, to + 1):
        print(f"{number} X {i} = {number * i}")


print_table()
print_table(6)
print_table(7, 31, 40)
