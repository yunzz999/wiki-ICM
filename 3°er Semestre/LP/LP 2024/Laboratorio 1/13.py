n=input()
size=len(n)
ceros=4-size
n=n+ceros*"0"
print(int(n[0])+int(n[1])+int(n[2])+int(n[3]))