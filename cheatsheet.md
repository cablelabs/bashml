
[[_TOC_]]

# Generating (config) files dynamically based on environemnts
```
cat > myfile <<ANY
any content of file with arbitrary
$ENVVAR replacements
ANY
```
create a file `myfile` with the content between
the `ANY` delimiters and all envs replaced. 

# Make sure script can be executed from any directory
Get script directory and cd into it
```
DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $DIR
```

# Select specific line from file
```
cat file | sed -n ${LINE}','${LINE}'p'
```
where `$LINE` is the line number you want to
extract.

# Read what is passed on stdin into variable
```
function getinput {
  while read line
  do
    echo -e "$line"
  done
}
X=$(getinput)
``` 

# Debug/Trace script/section line by line
```
set -x
# Debug On
set +x
# Debug Off
```

# Do arithemtic with arbitrary precision
```
echo "scale=$SCALE; 1.5/0.33" | bc
```
where `$SCALE` denotes the precision in decimals.
`scale=0` is useful to return integer values (floor).
bc also handles boolean results as `0` false and `1`
true.
```
echo "10.3 > 10.2" | bc
```

# Loop given number of steps
```
for i in `seq 1 $n`; do
  echo $i
done
```
loop `$n` times.

# Find content in files in directory structure
```
grep "$TOFIND" `find . -name "*.*"` 
```
find and report all files in current directory and sub directories
with `.` in their filename and the
contents in `$TOFIND`. 

# Count occurances of content in file column
```
cat file | awk {'print $'$COL'} | sort | uniq -c
```
count occurancoes of different content in columen `$COL`
in file `file`.

# Average and standard deviation of column one-liners
```
AVG=`cat file | awk '{ sum += $'$COL'; n++ } END { if (n > 0) print sum / n; }'`
STD=`cat file | awk '{sum += $'$COL'; sum2 += ($'$COL')^2} END {printf "%f \n", sqrt((sum2-sum^2/NR)/NR)}`
```
Compute average and standard deviation of column `$COL` in file `file`.

# Count rows and columns in file
```
COLUMNS=`head -n 1 file | awk '{print NF}'`
ROWS=`cat file | wc -l`
```
count columns and rows in file `file`.

# Use default values if envs are not set
```
VAL=${VAL:-10}
``` 
Sets default value `10` to env `VAL` if it is not set.

# Launch process in background then kill in another script
Launch
```
nohup ./process.sh > process.log 2>&1 &
echo -n "$!" > process.pid
```
Stop
```
cat process.pid | xargs kill
```

