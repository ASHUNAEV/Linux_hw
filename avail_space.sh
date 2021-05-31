#!/bin/bash

#Available partition space script.


Yellow='\e[93m'
Reset=\\e[39m
Magnet='\e[35m'
Red='\e[0;31m'
Green='\e[0;32m'

declare -i sum_available=0

Function_calculation_Kb()
{
        echo -e "$Yellow Available space of partitions:${sum_available} Kb $Reset"
        echo -e "$Green Size sapce of partitions:${sum_size} Kb $Reset"
        echo -e "$Magnet Using sapce of partitions:${used_size} Kb $Reset"
        echo -e "$Red Partitions space used in procent:$usage_space_procent% $Reset"
}

Function_calculation_Mb()
{
      available_mb=$(bc <<< "scale=3; ${sum_available}/1024")
      sum_mb=$(bc <<< "scale=3; ${sum_size}/1024")
      use_mb=$(bc <<< "scale=3; ${used_size}/1024")
        echo -e "$Yellow Awalibale space partitions:${available_mb} Mb $Reset"
        echo -e "$Green Size space partitions:${sum_mb} Mb $Reset"
        echo -e "$Magnet Using sapce of partitions:${use_mb} Mb $Reset"
        echo -e "$Red Partitions space used in procent:$usage_space_procent% $Reset"
        
}

Function_calculation_Gb()
{
      available_gb=$(bc <<< "scale=3; ${sum_available}/1024/1024")
      sum_gb=$(bc <<< "scale=3; ${sum_size}/1024/1024")
      use_gb=$(bc <<< "scale=3; ${used_size}/1024/1024")
        echo -e "$Yellow Awalibale space partitions:${available_gb} Gb $Reset"
        echo -e "$Green Size space partitions:${sum_gb} Gb $Reset"
        echo -e "$Magnet Using sapce of partitions:${use_gb} GB $Reset"
        echo -e "$Red Partitions space used in procent:$usage_space_procent% $Reset"
}

#-------------------------main----------------------
available_space_array=$(df | grep ^/ | tr -s ' ' | cut -d ' ' -f4)
size_space_array=$(df | grep ^/ | tr -s ' ' | cut -d ' ' -f2)
used_space_array=$(df | grep ^/ | tr -s ' ' | cut -d ' ' -f3)
#use_space_array=$(df | grep ^/ | tr -s ' ' | cut -d ' %' -f5 | tr -d '%')



#-------------------------Available sapce----------------------
array=($available_space_array)
for i in ${array[@]};
  do
    let "sum_available+=i"
  done


#echo -e "$Yellow Available space of partitions:$sum_available $Reset"

#-------------------------Size of all aprtitions-----------------------
array=($size_space_array)
for i in ${array[@]};
  do
    let "sum_size+=i"
  done

#echo -e "$Green Size sapce of partitions:$sum_size $Reset"


#--------------------------Used spice of partitions--------------

array=($used_space_array)
for i in ${array[@]};
  do
    let "used_size+=i"
  done

#echo -e "$Magnet Using sapce of partitions:$used_size $Reset"

#-----------------------Usage % for all partitions------------------

usage_space_procent=$(bc <<< "scale=2; ${used_size}/${sum_size}*100")

#echo -e "$Red Partitions space used in procent:$usage_space_procent% $Reset" 





#------------------------Keys-----------------------



while [ -n "$1" ]
  do
    case "$1" in
      -Kb) echo "Calculations in Kilobytes" 
            Function_calculation_Kb;;
      -Mb) echo "Calculations in Megabytes" 
            Function_calculation_Mb ;;
      -Gb) echo "Calculations in Gigabytes" 
            Function_calculation_Gb;;
        *) echo "$1 is no options, go to readme.txt" ;;
    esac
    shift
done



#if [ "$1" == "-Mb" ]; then
 
#fi

#exit

#elif [ "$1" == "-Gb" ]; then 
  
#else [ "$1" == "-Kb" ]
 
#fi 












#array=($use_space_array)
#for i in ${array[@]};
#  do
#    let "usage_size+=i"
#  done

#echo -e "$Magnet Usage space:$usage_size % $Reset"



