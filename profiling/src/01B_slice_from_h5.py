
#from memory_profiler import profile
import h5py
import numpy as np
import sys


#@profile
def slice_from_h5(h5_filename):
    f = h5py.File(h5_filename)
    x = f['table'][1000:int(sys.argv[1])]
    f.close()
    return x
   

if __name__ == "__main__":

    h5_filename = 'build/hetero1.h5'
    x_h5 = slice_from_h5(h5_filename)
