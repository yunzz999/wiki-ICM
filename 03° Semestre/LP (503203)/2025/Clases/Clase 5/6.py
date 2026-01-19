l=[6,2,5,5,4,5,6,3,7,6]
n=input("n: ")
sum=0
for i in range(len(n)):
    sum+=l[int(n[i])]
print(sum,"LEDs")