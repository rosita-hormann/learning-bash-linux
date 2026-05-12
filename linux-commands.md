# Linux commands

Cheat-sheet of linux commands.

## Memory usage
```bash
du
du -sh <path> # Total memory usage on "path" location.
du -hs -c * # Memory usage of all files of current folder

df # Memory usage on disks/disks partitions (showing block usage)
df -h # Memory usage on disks/disks partitions (showing block usage)

```

## Files and directories management
```bash

ls # List files and directories on current location
ls -lsa # same as ls but with details of owner, group, permission and last modification date

mkdir <folder-name> # Create directory
touch <file-name> # Create file

chmod atr filename # filename can also be a directory. Examples with atr:
chmod 777 filename
chmod +rwx filename # r=read, w=write, x=execute

chown <user.usergroup> <folder or file name> #change owner of file or directory



```

## Processes
```bash
ps aux
ps aux --forest # Forest of processes
ps -ef | grep <process-name> # filter processes by name
ps aux | grep -E <username> #filter processes by username

kill <pid> # Kill process by pid
kill -9 <pid> # Forces kill process by pid

# Processes resources usage:
top
htop
```


## Services (systemd and systemctl)
```bash
systemctl cat [service-name]
systemctl status [service-name]
systemctl stop [service-name]
systemctl start [service-name]
systemctl restart [service-name]
systemctl enable [service-name]
systemctl disable [service-name]

```

## Networking
```bash
netstat
netstat -putan # netstat but with ports included

ifconfig # Check configuration of interfaces (including IP address and mask)
ifconfig eth0 # Check infor about an specific interface.

nslookup <domain.name> # Check ip address of a given domain name
```

## Grep
```bash

```

## Search on files
```bash
grep -r "string-example" * # Search string-example in the content of every file of current 

find -name "file-name" # Search file by file-name on current dir
```

# Transfering files
```bash
 # Uploads file to server:
rsync -avz --progress <file> <user>@<server-address>:<file>

# Download file from server to current dir:
rsync -avz --progress <user>@<server-adress>:<file> .

```

# Users stuff

```bash
# Check users and groups
cat /etc/passwd

# Change owner of a file
chown USER:GROUP FILE
```

# Run stuff in background

```bash
# Different commands running stuff in background:

# Redirecting prints of Python (both normal and error messages)  into an output file
nohup python <python-script.py> <parameters> > output.log 2>&1 &

# This one does not print error messages into the output file
./my_script.sh &> output.log &

# Remove all files in a directory, in background, while logging the results
nohup bash -c 'for d in /home/my_user/Downloads; do [ -d "$d" ] && rm -rf "$d" && echo "Deleted $d at $(date)"; done; echo "deletion finished at $(date)"' > rm_rf_output.log 2>&1 &

```

# .bashrc file
_.bashrc_ file is used to add alias and define environment variables.

Add an environment variable to .bashrc
```bash
export VAR_NAME=/value/of/var
```
