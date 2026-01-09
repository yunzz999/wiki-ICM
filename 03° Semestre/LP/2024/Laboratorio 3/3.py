def certamenes (a,b,c):
    return round(0.2*a+0.3*b+0.5*c,2)

def nota_final(c,ts,a,d):
    return round(0.5*c+0.4*ts+0.04*a+0.06*d,2)

def aor (nf):
    if(nf>=3.95):
        return "Aprobado"
    else:
        return "Reprobado"    

def main():
    t=int(input())

    for i in range(t):
        nums=input()
        nums_str=nums.split()
        list=[round(float(num),2) for num in nums_str]

        nc=certamenes(list[0],list[1],list[2]) 
        nf=nota_final(nc,list[3],list[4],list[5])

        print(str(nc)+", "+str(nf)+" "+str(aor(nf)))
main()

