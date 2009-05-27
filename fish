#!/usr/bin/python

import scipy
import math

a = input("a1: ")
b = input("a2: ")
c = input("b1: ")
d = input("b2: ")

row1 = a + b 
row2 = c + d
column1 = a + c
column2 = b + d

pa = 0
x = 0

# hypergeometric distribution or something
def fish():
    z = scipy.comb(row1,a)*scipy.comb(row2,column1-a)/scipy.comb(row1 + row2,column1)
    return z

print "Results"

# "a1" for all other matrices with the same sums of rows and columns
if column1 - row2 > 0:
    a_first = column1 - row2 # so b2 can be natural because b2=row2-column1+a
else:
    a_first=0
a_last = min(row1, column1) # so a2 and b1 can be natural

pa = fish() # our P-cutoff value
print "P-cutoff value:", pa

# sum of p-values less or equal P-cutoff
for a in range(a_first, a_last +1): # +1 because that's how range works
# debug
#    print "matrix", a, row1 - a, column1 - a, row2 - column1 + a, "p", fish()
    if fish() <= pa:
        x = x + fish()
print "two-sided P:", x
