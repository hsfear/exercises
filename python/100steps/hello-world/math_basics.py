def print_squares_of_numbers_up_to(limit):
    for i in range(1, limit + 1):
        print(i * i)


def print_squares_of_even_numbers_uo_to(limit):
    for i in range(2, limit+1, 2):
        print(square(i))


def square(i):
    return i * i


def print_numbers_in_reverse(limit):
    for i in range(limit, 0, -1):
        print(i)


print_squares_of_numbers_up_to(6)
# print_squares_of_even_numbers_uo_to(8)
print_numbers_in_reverse(7)
