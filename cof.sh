#!/usr/bin/bash
#SBATCH --gpus-per-node=1
#SBATCh --nodes=1
#SBATCH --partition=thinkstation-p360
#SBATCH --nodelist=worker9
#SBATCH --output="result_foca.out"
srun matlab -nosplash -nodesktop -nodisplay -r "test_focalizado; exit"