def print_squares_upto(n: int):
    i = 1

    while (i * i) < n:
        print(f"{i * i}", end=' ')
        i += 1
    print()


print_squares_upto(100)