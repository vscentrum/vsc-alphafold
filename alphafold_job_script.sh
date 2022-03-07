#!/bin/bash
#PBS -N AlphaFold_tutorial_script_no_gpu
#PBS -l nodes=1:ppn=12:gpus=1
#PBS -l mem=64gb
#PBS -l walltime=24:0:0

PROTEIN=200-1

module load AlphaFold/2.1.2-foss-2021a-CUDA-11.3.1
export ALPHAFOLD_DATA_DIR=/arcanine/scratch/gent/apps/AlphaFold/20211201

WORKDIR=$VSC_DATA_VO_USER/alphafold/runs/$PBS_JOBID-$PROTEIN
mkdir -p $WORKDIR
cp -a $PBS_O_WORKDIR/fastas/$PROTEIN.fasta $WORKDIR/
cd $WORKDIR

echo Running $PROTEIN.fasta, output found at $WORKDIR
alphafold --fasta_paths=$PROTEIN.fasta \
          --max_template_date=2020-05-14 \
          --db_preset=full_dbs \
          --output_dir=$PWD \
          --model_preset=monomer_ptm \
          --use_gpu_relax \
          --run_relax