"""
This program calculates the error of the GeoCLAW output vs. the exact
solution provided in:
-Mungkasi and Roberts, 2011, ANZIAM Journal Vol.52: C349--363,"A new analytical solution for testing debris avalanche numerical models".

Jonathan Varkovitzky
December 6, 2011

Inputs:
- xGeo,x are the x-grids of GeoCLAW and the analytic solution respectively
- wGeo,w is the water level, including topography for GeoCLAW and the analytic solution respectively
"""
from numpy import *
from pylab import *
from matplotlib import *

def errorValue(x,w,xGeo,wGeo):
    print "********************************"
    print size(x)
    print "********************************"
    print xGeo
    print "********************************"
