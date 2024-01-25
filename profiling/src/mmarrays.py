
import sys
import numpy as np
#from memory_profiler import profile


def get_data(chunk_size):
    return np.random.rand(chunk_size).astype(np.float64)

#@profile
def write(file_name,chunk_size):

#open a file for data of a single column
    with open(file_name, 'wb') as f:
        #for 1024 "csv files"
        for _ in range(1024):
            csv_data =  get_data(chunk_size)
            f.write(csv_data.tobytes())
    
#@profile
def read(file_name):
    a = np.memmap(file_name, dtype=np.float64)
    return a

if __name__=="__main__":
    CHUNK_SIZE=int(sys.argv[1])
    FILE_NAME = 'data/mmarr.dat'

    write(FILE_NAME,CHUNK_SIZE)
    a = read(FILE_NAME)
    print("Data size = {:.3f} MB".format(a.nbytes*1e-6))
    print("Chunk size = {:.3f} MB".format(CHUNK_SIZE*8*1e-6))
