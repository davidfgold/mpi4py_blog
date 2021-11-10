'''
callDemoScript.py

Called to batch demoScript.m across multiple MPI tasks

Reads in the total tasks and number of samples per task from command line.
'''

# load necessary libraries
from mpi4py import MPI
import numpy as np
import sys
import os
import time

# locate the COMM WORLD communicator
comm = MPI.COMM_WORLD

# get the number of the current rank
rank = comm.Get_rank()

# read in arguments from the submission script
TOTAL_TASKS = int(sys.argv[1]) # number of MPI processes
N_SAMPLES_PER_TASK = int(sys.argv[2]) # number of runs per/task

# loop through runs assigned to current rank
for i in range(N_SAMPLES_PER_TASK):
	sample= rank + TOTAL_TASKS * i

	# write the command that will be sent to the terminal (here RUN will replace the {})
	terminal_command = "octave-cli ./demoScript.m {} {} ".format(rank, sample)

	# write the terminal command to the process
	os.system(terminal_command)

	# sleep before submitting the next command
	time.sleep(1) # optional, for memory intensive submissions

comm.Barrier()
