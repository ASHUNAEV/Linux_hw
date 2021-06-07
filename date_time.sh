#!/bin/bash
user=`whoami`
crontab <<< "*/1 * * * * /home/centos/linux_hw/date_time.sh" 
echo "Задание \"С Рождеством!\" добавлено." #day-month-year hh:mm AM/PM 
DATE=$(date +"%d-%m-%Y %I:%M %p")
echo "С Рождеством! Текущее время, $DATE" >> /tmp/temp_date