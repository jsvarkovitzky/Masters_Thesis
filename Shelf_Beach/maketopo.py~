
"""
Module to create topo for this example.
Piecewise linear composite beach and solitary wave.

"""
import sys
from pyclaw.geotools import topotools
import numpy as np


def generatetopo(test):
    print "Generating topography..."

    nxpoints = 100000
    nypoints = 6
    xlower = 0.
    xupper = 420000.
    dx = (xupper-xlower)/(nxpoints-1)
    ylower = 0.
    yupper = (nypoints-1)*dx
    slopeOffShelf = 0.25
    slopeOnBeach = 0.05
    x1 = 200000.
    x2 = x1+ 16000-400.
    x3 = x2+ 200000+400.
    x4 = x3 + 4000.
    
    def maketopo():
       """
       Output topography file for the entire domain
       """
       outfile= "oceanFloor.topotype2"     
       topotools.topo2writer(outfile,topo,xlower,xupper,ylower,yupper,nxpoints,nypoints)
       

    def topo(x,y):
        """
        Linear Slope
        """
        depth = 4000
        z = np.where(x<x1,0,0)
        z = np.where((x>x1)&(x<x2),slopeOffShelf*(x-x1),0)
        z = np.where((x>x2)&(x<x3),slopeOffShelf*(x2-x1),z)
        z = np.where((x>x3)&(x<x4),slopeOffShelf*(x2-x1)+slopeOnBeach*(x-x3),z)
        z = z - depth
        return z
    
    maketopo()

if __name__=='__main__':
    if len(sys.argv) > 1:
        generatetopo(sys.argv[1])
    else:
        generatetopo("A")
