# vsc-alphafold
Input files and scripts for running AlphaFold on VSC clusters

## Extract timings from AlphaFold output

```
out_file='example.out'
timing_data=$(grep 'Final timings' $outfile | sed 's/.*Final timings[^:]*://g')
python extract_timings.py "$timing_data"
```

Example output (for AlphaFold v2.1.2 on 12 cores + 1x A100 80GB @ HPC-UGent Tier-2 accelgor cluster)

```
$ python extract_timings.py "$timing_data"
MSA: 1002.1820905208588
predict: 450.7836320400238
relax: 51.146129846572876
```
