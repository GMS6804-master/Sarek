#!/bin/bash
#SBATCH --job-name=testSarek
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=jtk622@gmail.com
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=5
#SBATCH --mem=17gb
#SBATCH --time=02:00:00
#SBATCH --output=nextflow_%j.log
pwd; hostname; date

# load modules
module load ufrc
module load singularity/2.5.2
module load nextflow/0.32.0

echo "Running nextflow script on HiPerGator"

nextflow run main.nf --sample Sarek-data/testdata/tsv/tiny-manta.tsv --step mapping --genome smallGRCh37 --genome_base References/smallGRCh37 --tag latest -profile singularityslurm
