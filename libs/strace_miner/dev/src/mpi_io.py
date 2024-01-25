
from mpi4py import MPI
import numpy as np

# Initialize MPI
comm = MPI.COMM_WORLD
rank = comm.Get_rank()
size = comm.Get_size()

# Define the size of the shared numpy array
array_size = 10000  # Adjust the size as needed

# Create a numpy array for each rank
local_data = np.arange(array_size, dtype=np.float64)

# Create a filename for each rank
filename = f"data/data_rank_{rank}.npy"

# Save the local_data to a file
with open(filename,"wb") as f:
    print(f"Process {rank} writing {filename} ..")
    np.save(f, local_data)

# Barrier to synchronize processes before reading
comm.Barrier()


# Finalize MPI
MPI.Finalize()
