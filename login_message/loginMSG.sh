let upSeconds="$(/usr/bin/cut -d. -f1 /proc/uptime)"
let secs=$((${upSeconds}%60))
let mins=$((${upSeconds}/60%60))
let hours=$((${upSeconds}/3600%24))
let days=$((${upSeconds}/86400))
UPTIME=`printf "%d Tage, %02dh %02dm %02ds" "$days" "$hours" "$mins" "$secs"`
HOST=$(hostname)
Datum=$(date +"%A, %d. %B %Y")
Uhrzeit=$(date +"%T")
cpuTemp0=$(cat /sys/class/thermal/thermal_zone0/temp)
cpuTemp1=$(($cpuTemp0/1000))
cpuTemp2=$(($cpuTemp0/100))
cpuTempM=$(($cpuTemp2 % $cpuTemp1))
#i read the value from a DHT22 that exports to this path
roomTemp0=$(cat /home/pi/HAP-NodeJS/temp)
#i read the value from a DHT22 that exports to this path
roomHumid0=$(cat /home/pi/HAP-NodeJS/humid)
gpuTemp0=$(/opt/vc/bin/vcgencmd measure_temp)
gpuTemp0=${gpuTemp0//\'/°}
gpuTemp0=${gpuTemp0//temp=/}

df -T -h /
echo ""
echo "Willkommen, mein Meister"
echo ""
echo Datum: $Datum
echo Uhrzeit: $Uhrzeit
echo ""
echo "Systemlaufzeit: ${UPTIME}"
echo ""
echo Raumtemperatur: $roomTemp0"°C"
echo Luftfeuchtigkeit: $roomHumid0"%"
echo CPU: $cpuTemp1"."$cpuTempM"°C"
echo GPU: $gpuTemp0
echo ""
echo "eingeloggt bei Host $HOST"
echo ""
echo "Möge das Coden beginnen"
echo "" 


