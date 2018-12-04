class Book:
    def __init__(self, name: str, copies: int):
        self.name = name
        self.copies = copies

    def __str__(self):
        return f'Book[{self.name}, {self.copies}]'

    def __repr__(self):
        return repr((self.name, self.copies))

    def get_name(self) -> str:
        return self.name

    def increase_number_of_copies(self, delta: int):
        self.copies += delta

    def decrease_number_of_copies(self, delta: int):
        self.copies = self.copies - delta if self.copies >= delta else 0


book = Book('testing', 10)
print(book)

book.increase_number_of_copies(10)
print(book)

book.decrease_number_of_copies(5)
print(book)

book.decrease_number_of_copies(50)
print(book)


