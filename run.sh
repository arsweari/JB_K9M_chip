#!/bin/bash
#SBATCH -p long
#SBATCH --job-name=JB_K-M_chip
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=alsw5948@colorado.edu
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --mem=6gb
#SBATCH --time=50:00:00
#SBATCH --output=nextflow.out
#SBATCH --error=nextflow.err

pwd; hostname; date
echo "Hi there -- you've requested $SLURM_CPUS_ON_NODE core."

module load singularity/3.1.1

nextflow run nf-core/chipseq -r 1.1.0 \
-profile singularity \
--input design.csv \
--fasta /scratch/Users/alsw5948/JB_K-M/JB_K-M_chip/util/NCBIM37.genome.fa \
--gtf /scratch/Users/alsw5948/JB_K-M/JB_K-M_chip/util/gencode.vM1.annotation.gtf \
--macs_gsize 1.87e9 \
--blacklist mm9-blacklist.bed \
--broad
--broad_cutoff 0.05
--email alsw5948@colorado.edu \
--email_on_fail alsw5948@colorado.edu
-resume \
-c nextflow.config

date
