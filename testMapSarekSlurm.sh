#!/bin/bash
#SBATCH --job-name=testSarek           # Job Name
#SBATCH --mail-type=END,FAIL           # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=jtk622@gmail.com   # Where to send mail
#SBATCH --ntasks=1                     # Run a single task
#SBATCH --cpus-per-task=5              # CPUs per task
#SBATCH --mem=17gb                     # Job memory request
#SBATCH --time=02:00:00                # Time limit hrs:min:sec
#SBATCH --output=nextflow_%j.log       # Standard output and error log
pwd; hostname; date

# load modules
module load ufrc
module load singularity/2.5.2
module load nextflow/0.32.0

echo "Running nextflow script on HiPerGator"

nextflow run main.nf --sample Sarek-data/testdata/tsv/tiny-manta.tsv --step mapping --genome smallGRCh37 --genome_base References/smallGRCh37 --tag latest -profile singularityslurm
