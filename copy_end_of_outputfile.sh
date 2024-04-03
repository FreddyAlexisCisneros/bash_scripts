#!/bin/bash

# This bash script prints the 2nd to last line of an output file, to a new file that will be imported by the code.
# to initialize the particle distribution for a new simulations. The reason for this is that there were simulations
# running in France that stopped midway due to someone turning off the computer that the simulation was running on.

: <<'end_comment'
*******************
* Useful Commands * 
*******************
tail -2 $output_file > $new_file                   This command prints the second to last line in "output_file" to "new_file".
var=$(grep -o "[[:digit:]]\+" $new_file | wc -l)   This command assigns the number of values in "new_file" to var, should be equal to L.  
Seq=$(seq start step end) a                        Assigns the sequence of integers starting from start and ending in end in increments of size step.
end_comment

# The following block of code goes through a list of 10 directories, where "dirm" is the name of the mth directory.
# within this directory there will be outputfiles, where "outputn.txt" is the name of the output file for simulations with n particles.

directories=$(seq 1 1 10)                    
list_of_particle_numbers=$(seq 100 100 1000)

for dir in ${directories[@]}
do 
 path="/home/freddy/dir${dir}/"
 cd $path
 for n in ${list_of_particle_numbers[@]}
 do
  output_file="output${n}.txt"
  new_file="temp_${output_file}"
  [ -e $new_file] && rm $new_file 
  tail -2 $output_file > $new_file 
 done
 cd ../
done
