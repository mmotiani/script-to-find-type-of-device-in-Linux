declare -a devices
declare -a flags
devices=$(lsblk -d -n -oNAME,RO | grep '0$' | awk {'print $1'})
flags=$(lsblk -d -n -oROTA,RO | grep '0$' | awk {'print $1'})
echo
echo "Devices:"
number=1
echo "================"
for i in $devices
do
     echo $number" " $i
     number=$((number+1))
done
echo
echo "Type of device:"
echo "================"
number=1
counter=0
for i in $flags
do
     if [[ $i == 1 ]]; then
             echo $number" "" HDD"
     else
             echo $number" "" SDD"
     fi
     number=$((number+1))
     counter=$((counter+1))
done
