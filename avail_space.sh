#!/bin/bash

#Available partition space script.

Yellow='\e[93m'
Reset=\\e[39m
Magnet='\e[35m'
Red='\e[0;31m'
Green='\e[0;32m'

declare -i sum_available=0

#---------------------------Function-----------------------
Function_calculation_size()
{
  Coef1=$1
  Coef2=$2
  Size_name=$3
  
    available_size=$(bc <<< "scale=3; (${sum_available}/1024/1024)*($Coef1*$Coef2)")  
    sum_size_coef=$(bc <<< "scale=3; (${sum_size}/1024/1024)*($Coef1*$Coef2)")
    use_size_coef=$(bc <<< "scale=3; (${used_size}/1024/1024)*($Coef1*$Coef2)")
    echo -e "$Yellow Awalibale space partitions:${available_size} ${Size_name} $Reset"  
    echo -e "$Green Size space partitions:${sum_size_coef} ${Size_name} $Reset"
    echo -e "$Magnet Using sapce of partitions:${use_size_coef} ${Size_name} $Reset"
    echo -e "$Red Partitions space used in procent:$usage_space_procent% $Reset"
    
}

#------------------------Keys-----------------------
#----Если переданы пустые значения, считается в килобайтах.
if [[ $1 == '' ]]; 
  then
    echo "Calculations in Kilobytes"
    Calculations_in_Kilobytes='1024 1024 Kb'
    Coef='^/'
fi

while [ -n "$1" ];
  do
    case "$1" in
      -a) echo "Search in tmp folder"
          Coef='tmp' ;;
      -b) echo "Search in phys folder"
          Coef='^/' ;;
      -k) echo "Calculations in Kilobytes" 
            Calculations_in_Kilobytes='1024 1024 kb' ;;
            # Function_calculation_size 1024 1024 Kb ;;
      -m) echo "Calculations in Megabytes" 
            Calculations_in_Megabytes='1 1024 Mb' ;;
            # Function_calculation_size 1 1024 Mb ;;
      -g) echo "Calculations in Gigabytes" 
            Calculations_in_Gigabytes='1 1 Gb' ;;
            # Function_calculation_size 1 1 Gb ;;
      *) echo "$1 is no options, go to readme.txt" ;;
    esac
    shift
done

#-------------------------main----------------------  
     
     available_space_array=$(df | grep $Coef | tr -s ' ' | cut -d ' ' -f4)
     size_space_array=$(df | grep $Coef | tr -s ' ' | cut -d ' ' -f2)
     used_space_array=$(df | grep $Coef | tr -s ' ' | cut -d ' ' -f3)

#-------------------------Available sapce----------------------

array=($available_space_array)
for i in ${array[@]};
  do
    let "sum_available+=i"
  done

#-------------------------Size of all aprtitions-----------------------

array=($size_space_array)
for i in ${array[@]};
  do
    let "sum_size+=i"
  done

#--------------------------Used spice of partitions--------------

array=($used_space_array)
for i in ${array[@]};
  do
    let "used_size+=i"
  done

#-----------------------Usage % for all partitions------------------

usage_space_procent=$(bc <<< "scale=2; ${used_size}/${sum_size}*100")


#----------------------Function with parametrs---------------

if [[ $Calculations_in_Kilobytes != '' ]];
  then
    Function_calculation_size $Calculations_in_Kilobytes

elif [[ $Calculations_in_Megabytes != '' ]];
  then
    Function_calculation_size $Calculations_in_Megabytes

elif [[ $Calculations_in_Gigabytes != '' ]];
  then
    Function_calculation_size $Calculations_in_Gigabytes
else
  echo "Please run script with two keys!"

fi



exit








# if [[ $Calculations_in_Kilobytes != '' ]];
#   then
#     Function_calculation_size $Calculations_in_Kilobytes

# fi

# if [[ $Calculations_in_Megabytes != '' ]];
#   then
#     Function_calculation_size $Calculations_in_Megabytes

# fi

# if [[ $Calculations_in_Gigabytes != '' ]];
#   then
#     Function_calculation_size $Calculations_in_Gigabytes

# fi
exit



# 
#_________________________________________________old________________

# echo -e "$Yellow Available space of partitions:$sum_available $Reset"

# echo -e "$Green Size sapce of partitions:$sum_size $Reset"

# echo -e "$Magnet Using sapce of partitions:$used_size $Reset"

#echo -e "$Red Partitions space used in procent:$usage_space_procent% $Reset" 

#  t) echo "Search in temp" 
      #       #Function_search_folder tmp ;;
      #       Coef='tmp' 
      #       echo "-----$Coef";;
      #  p) echo "Search in /dev" 
      #       #Function_search_folder ^/ ;;
      #       Coef='^/' ;;

# available_space_array=$(df | grep ^/ | tr -s ' ' | cut -d ' ' -f4)
# size_space_array=$(df | grep ^/ | tr -s ' ' | cut -d ' ' -f2)
# used_space_array=$(df | grep ^/ | tr -s ' ' | cut -d ' ' -f3)



#use_space_array=$(df | grep ^/ | tr -s ' ' | cut -d ' %' -f5 | tr -d '%')


if [[ $1 == '' ]]; 
  then
    echo "Calculations in Kilobytes"
    Function_calculation_size 1024 1024 Kb
fi


# Function_search_folder()
# {
#   Coef=$1
#      available_space_array=$(df | grep $Coef | tr -s ' ' | cut -d ' ' -f4)
#      size_space_array=$(df | grep $Coef | tr -s ' ' | cut -d ' ' -f2)
#      used_space_array=$(df | grep $Coef | tr -s ' ' | cut -d ' ' -f3)
# }

# Function_phys_folder()
# {
#        available_space_array=$(df | grep ^/ | tr -s ' ' | cut -d ' ' -f4)
#      size_space_array=$(df | grep ^/ | tr -s ' ' | cut -d ' ' -f2)
#      used_space_array=$(df | grep ^/ | tr -s ' ' | cut -d ' ' -f3)

# Function_tmp_folder()
# {
#     available_space_array=$(df | grep tmp | tr -s ' ' | cut -d ' ' -f4)
#     size_space_array=$(df | grep tmp | tr -s ' ' | cut -d ' ' -f2)
#     used_space_array=$(df | grep tmp | tr -s ' ' | cut -d ' ' -f3)
# }

# echo "$Coef ----QQQQQQQQQQQQQQQQQQQQQQQQQQQ"


# while getopts tpkmg opt;
#   do
#     case "$opt" in
#       t) echo "Search in temp" 
#             #Function_search_folder tmp ;;
#             Coef='tmp' 
#             echo "-----$Coef";;
#       p) echo "Search in /dev" 
#             #Function_search_folder ^/ ;;
#             Coef='^/' ;;
#       k) echo "Calculations in Kilobytes" 
#             Calculations_in_Kilobytes='1024 1024 kb' ;;
#             #Function_calculation_size 1024 1024 Kb ;;
#       m) echo "Calculations in Megabytes" 
#             Calculations_in_Megabytes='1 1024 Mb' ;;
#             #Function_calculation_size 1 1024 Mb ;;
#       g) echo "Calculations in Gigabytes" 
#             Calculations_in_Gigabytes='1 1 Gb' ;;
#             #Function_calculation_size 1 1 Gb ;;
#       *) echo "$1 is no options, go to readme.txt" ;;
#     esac
#     shift
# done
# while [ -n "$2" ]
#   do
#     case "$2" in
#       -a) echo "Search in tmp folder"
#           Coef='tmp' ;;
#       -b) echo "Search in phys folder"
#           Coef='^/' ;;
#        *) echo "$2 is no options, go to readme.txt"
#     esac
#     # shift
# done

#while [ -n "$2" ];
#   do
#     case "$2" in
#       -a) echo "Search in tmp folder"
#           Coef='tmp' ;;
#       -b) echo "Search in phys folder"
#           Coef='^/' ;;
#        *) echo "$2 is no options, go to readme.txt"
#     esac
#      #shift
# done

# Function_calculation_Kb()
# {
#         echo -e "$Yellow Available space of partitions:${sum_available} Kb $Reset"
#         echo -e "$Green Size sapce of partitions:${sum_size} Kb $Reset"
#         echo -e "$Magnet Using sapce of partitions:${used_size} Kb $Reset"
#         echo -e "$Red Partitions space used in procent:$usage_space_procent% $Reset"
# }

# Function_calculation_Mb()
# {
#       #available_mb=$(bc <<< "scale=3; ${sum_available}/1024/$Coef1*$Coef2*$Coef3")  Coef=1024 && 1 $size_name
#       sum_mb=$(bc <<< "scale=3; ${sum_size}/1024")
#       use_mb=$(bc <<< "scale=3; ${used_size}/1024")
#         echo -e "$Yellow Awalibale space partitions:${available_mb} Mb $Reset"
#         echo -e "$Green Size space partitions:${sum_mb} Mb $Reset"
#         echo -e "$Magnet Using sapce of partitions:${use_mb} Mb $Reset"
#         echo -e "$Red Partitions space used in procent:$usage_space_procent% $Reset"
        
# }

# Function_calculation_Gb()
# {
#       available_gb=$(bc <<< "scale=3; ${sum_available}/1024/1024")
#       sum_gb=$(bc <<< "scale=3; ${sum_size}/1024/1024")
#       use_gb=$(bc <<< "scale=3; ${used_size}/1024/1024")
#         echo -e "$Yellow Awalibale space partitions:${available_gb} Gb $Reset"
#         echo -e "$Green Size space partitions:${sum_gb} Gb $Reset"
#         echo -e "$Magnet Using sapce of partitions:${use_gb} GB $Reset"
#         echo -e "$Red Partitions space used in procent:$usage_space_procent% $Reset"
# }

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