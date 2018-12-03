def is_prime(n: int) -> bool:
    if n < 2:
        return False

    for i in range(2, int(n / 2)):
        if (n % i) == 0:
            return False

    return True


print(f"is_prime({5}): {is_prime(5)}")
print(f"is_prime({8}): {is_prime(8)}")
print(f"is_prime({47}): {is_prime(47)}")


def sum_upto_n(n: int) -> int:
    acc = 0
    for i in range(1, n + 1):
        acc += i
    return acc


print(f"sum_upto_n({5}): {sum_upto_n(5)}")


def sum_of_divisors(n: int) -> int:
    acc = 0
    for i in range(2, n):
        if (n % i) == 0:
            acc += i
    return acc


print(f"sum_of_divisors({6}): {sum_of_divisors(6)}")


def print_number_triange(n: int):
    for i in range(1, n+1):
        for j in range(1, i+1):
            print(f"{j} ", end='')
        print()


print_number_triange(6)
