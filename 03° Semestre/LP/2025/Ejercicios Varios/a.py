def is_an(s1,s2):
    for s in s1:
        if s not in s2:
            return False

    for s in s2:
        if s not in s1:
            return False

    return True



s1=input("s1: ")
s2=input("s2: ")
print(is_an(s1,s2))