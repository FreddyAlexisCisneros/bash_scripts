#!/bin/bash

Ns=(2547 3820 5093 6366 7639)
Dirs=(5 6 7 8)

line_from_end=1

for Dir in ${Dirs[@]}
 do 
 dir_="/Users/freddycisneros/Desktop/activematter/Mar182024dataretreival/test${Dir}prime/"
 cd $dir_
 for N in ${Ns[@]}
  do 
  name_of_file="averages_for_N_${N}_Lx_100_Ly_100_grad_0_Dr_0.15_Dt_3.33_dt_0.000800.txt"
  
  # removing the last line of the files.
  #scp $name_of_file temp.txt
  #sed -e '$ d' temp.txt > $name_of_file
  #rm temp.txt
  
  # now attaching the new last line to temp files
  
  #temp_name_of_file="temp_${name_of_file}"
  #rm $temp_name_of_file
  #tail -1 $name_of_file > $temp_name_of_file
  #Var=$(grep -o "[[:digit:]]\+" $temp_name_of_file | wc -l)
  done
 cd ../
done