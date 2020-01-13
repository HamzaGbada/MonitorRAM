#!/bin/bash
memory(){
# MemUsed = Memtotal + Shmem - MemFree - Buffers - Cached - SReclaimable

x1=$(grep MemTotal: /proc/meminfo)
y1=($x1)
Memtotal=${y1[1]}
x2=$(grep Shmem: /proc/meminfo)
y2=($x2)
Shmem=${y2[1]}
x3=$(grep Buffers: /proc/meminfo)
y3=($x3)
Buffers=${y3[1]}
x4=$(grep Cached: /proc/meminfo)
y4=($x4)
Cached=${y4[1]}
x5=$(grep SReclaimable: /proc/meminfo)
y5=($x5)
SReclaimable=${y5[1]}
x6=$(grep MemFree: /proc/meminfo)
y6=($x6)
MemFree=${y6[1]}

MemUsed=$(( Memtotal + Shmem - MemFree - Buffers - Cached - SReclaimable ))

echo "$(( MemUsed / 1024 ))"
}
b=1
i=0
x=(0 1 2 3 4 5 6 7 8 9)
while [ $b -eq 1 ]
do
	if [ $i -lt 10 ]
	then 
		x[$i]=$(memory)
		echo "$x" >> file.dat
		i=$((i + 1))
	fi
i=0
y=$(wc -l file.dat)
h=($y)
k=${h[0]}
#echo $k
	if [ $k -gt 10 ]
		then
		cat /dev/null > file.dat
	fi
#./graph.sh
done


