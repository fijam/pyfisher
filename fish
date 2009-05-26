#!/usr/bin/python

import scipy
import math

a = input("a: ")
b = input("b: ")
c = input("c: ")
d = input("d: ")

zl = 1.96 # confidence limit dla 95%

w1 = a + b 
w2 = c + d
k1 = a + c
k2 = b + d
pa = 0
x = 0

def fish():
    z = scipy.comb(w1,a)*scipy.comb(w2,k1-a)/scipy.comb(w1 + w2,k1)
    return z

print "WYNIKI"

#try:
#    oddsr = float(a * d) / float(b * c)
#    seln = math.sqrt(1/float(a) + 1/float(b) + 1/float(c) + 1/float(d))
#    conf1 = math.exp(math.log(oddsr) - zl * seln)
#    conf1b = oddsr - zl * seln
#    conf2 = math.exp(math.log(oddsr) + zl * seln)
#    conf2b = oddsr + zl * seln
#    print "OR:", oddsr
#    print "CI dla z =", zl, ":", conf1, conf1b, conf2, conf2b
#except ArithmeticError:
#    print "BLAD. Do obliczenia OR wszystkie liczby musza byc > 0"


if k1 - w2 > 0:
    od = k1 - w2
else:
    od=0
do = min(w1, k1)
#print "od:", od, "do", do

pa = fish()
print "pa:", pa
for a in range(od, do + 1):
    print "macierz", a, w1 - a, k1 - a, w2 - k1 + a, "p", fish()
    if fish() <= pa:
        x = x + fish()
print "two-sided p:", x
