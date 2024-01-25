
from memory_profiler import profile
import numpy as np
import h5py
import sys

#@profile
def slice_from_csv(csv_filename):
    
    dt = np.dtype([('name','S20'),
                   ('city','S20'),
                   ('x','f8'),
                   ('y','f8'),
                   ('z','f8')])

    np_data = np.genfromtxt(csv_filename,delimiter=',',dtype=dt,names=True)
    x = np_data[1000:int(sys.argv[1])]
    return x
   

if __name__ == "__main__":

    csv_filename = 'build/hetero1.csv'
    x_csv = slice_from_csv(csv_filename)
