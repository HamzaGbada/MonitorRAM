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
while [ $b -eq 1 ]
do
	mem_value=$(memory)
	echo "$i $mem_value" >> file.dat
	i=$((i + 1))
	
	# Count lines in file
	y=$(wc -l file.dat 2>/dev/null)
	h=($y)
	k=${h[0]:-0}
	
	# Keep only last 20 lines (sliding window)
	if [ $k -gt 20 ]
	then
		tail -20 file.dat > file.dat.tmp
		mv file.dat.tmp file.dat
	fi
	
	sleep 1
done


