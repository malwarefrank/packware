#!/bin/sh
python training.py config_exp-diffpackedbenign $1
cd ../results/
respath=../../results/paper/experiments/exp-diffPackedBenign/$1/dll-generic-header-import-ngrams-opcodes-rich-sections-strings/
db=$respath/exp.db
json=$db.json
csv=$db.csv
python process_sql.py $db
python add_metrics_csv.py $csv $csv
python top_features.py $json 50
python plot_diffpackedbenign.py $csv
cd $(dirname "$0")
