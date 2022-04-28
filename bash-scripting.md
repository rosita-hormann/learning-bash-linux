# Bash Scripting

## Introduction
Anything you can run normally on the command line can be put into a script and it will do exactly the same thing. Similarly, anything you can put into a script can also be run normally on the command line and it will do exactly the same thing.

Usually bash scripts files has .sh extention

## Executing a Bash Script

Before we can execute a script it must have the execute permission set (for safety reasons this permission is generally not set by default)

```bash
./myscript.sh

```

When running a command, Bash only looks in the specific directories stored at the variable $PATH and doesn't consider sub directories or your current directory. It will look through those directories in order and execute the first instance of the program or script that it finds.

See $PATH executing ```echo $PATH``` in command line.

## The Shebang (#!)
```#!/bin/bash```

This is the first line of the script above. The hash exclamation mark ( #! ) character sequence is referred to as the Shebang. Following it is the path to the interpreter (or program) that should be used to run (or interpret) the rest of the lines in the text file. (For Bash scripts it will be the path to Bash, but there are many other types of scripts and they each have their own interpreter.)

## Variables
variable=value

Examples:
```bash
number=12321
var1=HelloWorld
echo $number $var1
```
```bash
sampledir=/etc
ls $sampledir
```

Examples or more complex variables values:
```bash
myvar='Hello World'
echo $myvar # prints Hello World

newvar="More $myvar"
echo $newvar # prints More Hello World

newvar='More $myvar'
echo $newvar #prints More $myvar

# Single quotes will treat every character literally.
# Double quotes will allow you to do substitution (that is include variables within the setting of the value).

```

Example of command substitution:
```bash
myvar=$( ls )
print $myvar #prints what should be showed when running ls command
```

Example of changing scope for a variable:
```bash
myvar='some value'
export $myvar
./other-script.sh #now other-script.sh has access to $myvar
```

### Special variables
$0 - The name of the Bash script.
$1 - $9 - The first 9 arguments to the Bash script. (As mentioned above.)
$# - How many arguments were passed to the Bash script.
$@ - All the arguments supplied to the Bash script.
$? - The exit status of the most recently run process.
$$ - The process ID of the current script.
$USER - The username of the user running the script.
$HOSTNAME - The hostname of the machine the script is running on.
$SECONDS - The number of seconds since the script was started.
$RANDOM - Returns a different random number each time is it referred to.
$LINENO - Returns the current line number in the Bash script.

You can check others special variables running the command ```env```

## Input and output
```bash
echo Insert name please
read name
echo Hello, $name
```

```bash
read -p 'Username: ' uservar
read -sp 'Password: ' passvar
```

```bash
echo Please enter name and age
read name age
```

There is also an STDIN way to enter data.

## Arithmetic
Basic arithmetic using let to save result of operation in a variable.
```bash
let a=5+4

let "a = 5 + 4"

let a++

let "a = 4 * 5"

```
+, -, *, /, %
var++ var--

Arithmetic using expr to print the result
```bash
expr 1 + 2
```

Saving values using (( expression )):
```bash
a=$(( 4 + 5 ))

a=$((3+5))

b=$(( a + 3 ))

b=$(( $a + 4 ))

(( b++ ))

(( b += 3 ))
```

Length of variable:
```bash
a='Hello World'
echo ${#a} # 11
```

## If statements
```bash
#!/bin/bash

if [ $1 -ge 18 ]
then
    echo You may go to the party.
elif [ $2 == 'yes' ]
then
    echo You may go to the party but be back before midnight.
else
    echo You may not go to the party.
fi

if [ $1 -gt 100 ]
then
    echo Hey that\'s a large number.
    if (( $1 % 2 == 0 ))
    then
        echo And is also an even number.
    fi
fi
```
Logical commands to use in condition:
! EXPRESSION	The EXPRESSION is false.
-n STRING	The length of STRING is greater than zero.
-z STRING	The lengh of STRING is zero (ie it is empty).
STRING1 = STRING2	STRING1 is equal to STRING2
STRING1 != STRING2	STRING1 is not equal to STRING2
INTEGER1 -eq INTEGER2	INTEGER1 is numerically equal to INTEGER2
INTEGER1 -gt INTEGER2	INTEGER1 is numerically greater than INTEGER2
INTEGER1 -lt INTEGER2	INTEGER1 is numerically less than INTEGER2
-d FILE	FILE exists and is a directory.
-e FILE	FILE exists.
-r FILE	FILE exists and the read permission is granted.
-s FILE	FILE exists and it's size is greater than zero (ie. it is not empty).
-w FILE	FILE exists and the write permission is granted.
-x FILE	FILE exists and the execute permission is granted.
&& and
|| or

## Loops

```bash
# while loop
counter=1
while [ $counter -le 10 ]
do
    echo $counter
    ((counter++))
done

#until loop
counter=1
until [ $counter -gt 10 ]
do
    echo $counter
    ((counter++))
done

#for in list loop
names='Stan Kyle Cartman'
for name in $names
do
    echo $name
done

#for in range loop
for value in {1..5} #can also be {start..end..step}
do
    echo $value
done

#for in array loop
my_array=("elem1" "elem2" "elem3")

for elem in "${my_array[@]}"
do
    echo $elem
done


```

<!-- ## Cheat Sheet
```bash
./myscript.sh

``` -->