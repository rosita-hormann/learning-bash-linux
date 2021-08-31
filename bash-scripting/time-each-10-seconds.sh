
#!/bin/bash

i=1
while [ $i -le 5 ]
do
    echo $(date +"%Y-%M-%d %R:%S")
    sleep 10s
    ((i++))
done