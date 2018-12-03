first = int(input("Enter the first number: "))

second = int(input("Enter the second number: "))

operation = input("Enter the operation [+-*/]: ")

if operation == '+':
    result = first + second
elif operation == '*':
    result = first * second
elif operation == '-':
    result = first - second
elif operation == '/':
    result = first / second
else:
    raise ValueError(f"Invalid operation {operation}")

print(result)
