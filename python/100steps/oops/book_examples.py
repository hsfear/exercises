class Book:
    def __init__(self, name):
        self.name = name

    def get_name(self):
        return self.name

    def __str__(self):
        return f"Book[{name}]"

    def __repr__(self):
        return repr(self.name)


book1 = Book("testing")

print(book1.get_name())
