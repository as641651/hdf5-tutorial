
import numpy as np
import threading
import os

# Create a large sample NumPy array
large_data = np.arange(1000000)

# Define the number of threads
num_threads = 4

# Define the function that will write the array to the file
def write_large_array_to_file(filename, data, start, end):
    with open(filename, 'ab') as file:  # Use 'ab' for append and binary mode
        #print("Opening")
        np.save(file, data[start:end])

# Create and start the threads
threads = []
chunk_size = len(large_data) // num_threads
filename = 'data/multi_threaded.npy'
if os.path.exists(filename):
    os.remove(filename)
    
for i in range(num_threads):
    start = i * chunk_size
    end = start + chunk_size if i < num_threads - 1 else len(large_data)
    thread = threading.Thread(target=write_large_array_to_file, args=(filename, large_data, start, end))
    thread.start()
    threads.append(thread)

# Wait for all threads to finish
for thread in threads:
    thread.join()

#print("All threads have finished writing to the file.")
