import math
from scipy import integrate
import numpy as np
import matplotlib.pyplot as plt
pi=3.1416

def f(t):
    return (3+4*math.sin(t))/(5-4*math.cos(t))
def f_cos(t,k):
    return f(t)*math.cos(k*t)
def f_sin(t,k):
    return f(t)*math.sin(k*t)

#Intregrando
def a_0():
    resultado,_=integrate.quad(f,0,2*pi)
    return (1/pi)*resultado

def a_k (k):
    resultado,_=integrate.quad(f_cos,0,2*pi)
    return (1/pi)*resultado
def b_k (k):
    resultado,_=integrate.quad(f_sin,0,2*pi)
    return (1/pi)*resultado

def F(t,n):
    resultado=1/2*a_0()
    for k in range(1,n):
        resultado+=a_k(k)*math.cos(k*t)+b_k(k)*math.sin(k*t)
    return resultado

x = np.linspace(0, 2*np.pi, 100)
y=F(x,2)
plt.plot(x, y)
plt.title('Gráfico de la función')
plt.xlabel('x')
plt.ylabel('y')
plt.grid(True)
plt.show()