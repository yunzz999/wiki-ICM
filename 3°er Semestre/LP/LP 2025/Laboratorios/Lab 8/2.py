def req(s):
    sum=0
    voc=["A","E","I","O","U"]
    for i in range(len(s)):
        if s[i] not in voc:
            sum+=1
    if(sum>=4):
        return True
    else:
        return False


def can(w1,w2):
    voc=["A","E","I","O","U"]
    x=len(w1)
    for s in w1:
        if s not in voc and s not in w2:
            return False
    return True


l=[]
s=input()
while(s!=""):
    if(req(s)):
        l.append(s)
    s=input()

wrd=input()
for i in range(len(l)):
    if(can(l[i],wrd)):
        print(l[i])