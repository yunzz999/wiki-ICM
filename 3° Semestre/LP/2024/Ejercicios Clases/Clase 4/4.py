linea=input()
linea=linea.split()
list=[int(num)for num in linea]

current_n=0
next_n=0

up=0
down=0

for i in range(1,len(list)+1):
    current_n=list[i]
    if(i+1<len(list)):
        next_n=list[i+1]
    else:
        break
    
    if(current_n>next_n):
        down+=1

    elif(current_n<=next_n):
        up+=1


print("Saltos arriba: ",up)
print("Saltos abajo: ",down)


