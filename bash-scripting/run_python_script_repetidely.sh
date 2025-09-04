#!/bin/bash

# ##############################################################
#
# RUN  PYTHON SCRIPT MANY TIMES
# 
# This is intended to run a Python script that transforms txt files
# into json files.
#
#
#
#
# HOW TO EXECUTE THIS SCRIPT
#
# First modify variables basepath and year to match the source of
# the monitoring files as well as what year you want to process.
#
# Then run the following commands:
#
# source venv/bin/activate
# ./run_python_script_repetidely.sh &> logs/txt_to_json/2024.log &
# disown
# tail -f logs/txt_to_json/2024.log
# tail -f logs/txt_to_json/2024_12.log
# tail -f logs/txt_to_json/month_to_json.log
#
#
#
# If you want to run the Python script for a month, directly, run instead:
#
# source venv/bin/activate
# nohup python multiprocessing_files_transformation.py /mnt/temp/dodona-data/ /mnt/LTS/ 2024 12 > logs/txt_to_json/2024_12.log 2>&1 &
#
# Link to Python script that is run by this script:
# https://github.com/rosita-hormann/learning-python/blob/master/my-scipts/multiprocessing_files_transformation.py
#
# ##############################################################


##############
# Directories
basepath="/mnt/temp/txt/" # Origin path of TXT formatted files
lts_data="/mnt/temp/json" # Place where Json files will be stored.
##############

##############
# Date to process:
year="2024" # Year to process

declare -a list_months=("12" "11" "10" "09" "08" "07" "06" "05" "04" "03" "02" "01")
#declare -a list_months=("02" "01")
############

#for month in `ls "$basepath"/"$year" | sort -d -r`; do # another way that programaticall obtains the list of months
for month in "${list_months[@]}"; do
	echo -e "[ $(date +"%Y-%m-%d %R")] \t Processing: ${year}/${month}"
	mkdir -p "logs/txt_to_json/"
	log_file_name="logs/txt_to_json/${year}_${month}.log"
	#echo $log_file_name
	python -u multiprocessing_files_transformation.py ${basepath} ${lts_data} ${year} ${month} > ${log_file_name} 2>&1

        echo -e "[ $(date +"%Y-%m-%d %R")] \t Processed ${year}/${month}! Going to sleep"
	sleep 10
	echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
done;
