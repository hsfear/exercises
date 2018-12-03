import string

vowels = "aeiou"


def is_char(ch: str) -> bool:
    return len(ch) == 1


def is_vowel(ch: str) -> bool:
    return is_char(ch) and ch.lower() in vowels


def is_consonant(ch: str) -> bool:
    return is_char(ch) and ch.lower().isalpha() and ch not in vowels


def words(ch: str) -> list:
    return ch.split()


print(is_vowel("a"))
print(is_vowel("b"))
print(is_vowel("ab"))
print(is_vowel(""))

print(is_consonant("a"))
print(is_consonant("b"))
print(is_consonant("ab"))
print(is_consonant(""))


print(string.ascii_lowercase)
print(string.ascii_uppercase)

for word in words("this is a string"):
    print(word)
