#!/bin/bash

#SBATCH --job-name=testSarek
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=jtk622@gmail.com
#SBATCH --qos=djlemas-b
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=150gb
#SBATCH --time=30:00:00
#SBATCH --output=nextflow_%j.log
pwd; hostname; date

starttime=$(date)

echo "Mapping Has Started at" $starttime | mail -s "UFRC HPC SLURMP" jtk622@gmail.com


# load modules

module load ufrc
module load singularity
module load nextflow/0.32.0

echo "Running nextflow script on HiPerGator"

nextflow run main.nf --sample UF-data/UFsampledata.tsv --step mapping --genome GRCh37 --genome_base References/GRCh37 --tag latest -profile singularityslurm


date

endtime=$(date)

echo "Mapping Has Started at" $starttime "AND Mapping Has Finished at" $endtime  | mail -s "UFRC HPC SLURM" jtk622@gmail.com

