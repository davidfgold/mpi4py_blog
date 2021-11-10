RUNS_PER_TASK=5
N_NODES=2
TASKS_PER_NODE=2

TOTAL_TASKS=$(($N_NODES*$TASKS_PER_NODE))
echo $TOTAL_TASKS
#!/bin/bash
#SBATCH -n $(TOTAL_TASKS) -N $(N_NODES)
#SBATCH --time=0:01:00
#SBATCH --job-name=demoMPI4py
#SBATCH --output=output/demo.out
#SBATCH --error=output/demo.err
#SBATCH --exclusive
module load py3-mpi4py
module load py3-numpy
module load octave/6.3.0

echo $TOTAL_TASKS
time mpirun -np $TOTAL_TASKS python3 callDemoScript.py $TOTAL_TASKS $RUNS_PER_TASK > demoOutput.txt
