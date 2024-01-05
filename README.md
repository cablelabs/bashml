# BashML Library

BashML is a Machine Learning library
developed entirely in bash. 

The purpose of the library is to run
on embedded or restricted Linux devices that lack
support for higher-level programming
languages and where disk space and
memory may be limited or package installation
not possible or difficult. The benefits include:

- zero install
- zero config
- single dependency (bash)
- easy to use
- composition friendly (pipes)
- universally applicable to multitude of ML problems
- multi-platform
- light-weight (~800 lines of code, ~19kB)

The solution has been tested on [MacOS](#macos), [Ubuntu Linux](#ubuntu), [Windows (Git-bash)](#windows), [Android](#android), [RaspberryPi](#raspberrypi), and [OpenWrt](#openwrt).

The following models are currently
supported.

- [Multiple Linear Regression (MLR)](https://www.investopedia.com/terms/m/mlr.asp), supervised
- [Q-table Reinforement Learning, a.k.a. Q-learning (QL)](https://en.wikipedia.org/wiki/Q-learning), unsupervised
- [Decision Trees (DT)](https://en.wikipedia.org/wiki/Decision_tree), supervised
- [Random Forest (RF)](https://en.wikipedia.org/wiki/Random_forest), supervised
- [Logistic Regression (LR)](https://en.wikipedia.org/wiki/Logistic_regression), supervised

## General Design
BashML is designed to take advatage
of pipes and basic input/output handling.

Calculations are done with the `bc` command
as bash only supports integer arithmetic
natively. Simple `sed`,`awk`, and `tr` commands,
combined with `cat`, `echo` and `printf`
comprise the bulk of the code. All these
commands are pre-installed with bash on most
Unix/Linux systems, including MacOS.

## Multipe Linear Regression
MLR models are simple
yet powerful, in that most supervised feature and output
vector ML formulations can be expressed
as MLR models. BashML supports
training and execution of MLR
models using ordinary
least squares (OLS) fitting.

See: [ols](#ols),[mlr](#mlr)

## Qlearning
Similarly QL is the simplest form or reinforcement
learning, yet it is generally applicable to many RL
problems.  

See: [ql](#ql)

## Decision Trees and Random Forest
Desicion Trees also lend themselves to simple training
and execution of many classification problems. BashML implements
the ID3 algorithm as well as a Random Forest feature bagging
algorithm.

See: [id3](#id3),[dt](#dt),[rf](#rf)

## Logistic Regression
LR models are popular when the outcomes
are probabilities of events. Although similar to MLR
the fitting is quite different as it uses gradient descent.

See: [lr](#lr)

## Generic Math Functions
To avoid external dependencies some generic
math functions have been implemented, including:

- [entropy](#entropy),[gain](#gain),[maxgain](#maxgain) used to build decision trees.
- [dot](#dot),[mult](#mult),[transpose](#transpose),[invert](#invert) used to build MLR and LR models

## Portability Functions
Although many of the basic built-in utilities on Linux are standardized
by [POSIX](https://pubs.opengroup.org/onlinepubs/9699919799/idx/utilities.html) or defacto standard in [GNU Core utilities](https://www.gnu.org/software/coreutils/) they may not all be present
on some of the stripped down flavors and forks of Linux. Hence, some simple portability functions were implemented
to provide cross-platform support without having to install additional packages.
The bc, shuf, and diff commands have been reimplemented with simpler awk-based commands as
[bcg](#bcg), [shufg](#shufg) and [diffg](#diffg). The bc command is frequently used and performance sensitive, so
the tools will detect if it is present on the system and if so use it instead of the
bcg version based on awk, which tends to be a bit slower.

## Usage Example
To use the library first put the `bin`
directory in your path, e.g.:
```
export PATH=`pwd`/bin:PATH
```

To train an MLR model put the training feature data
in a file, called, e.g. `X`:
```
1 7 560
1 3 220
1 3 340
1 4 80
1 6 150
1 7 330
```
and the training output data in a file 
called, e.g. `y`:
```
16.68
11.50
12.03
14.88
13.75
18.11
```
Now train the model as follows:
```
cat X | bashml ols $(cat y | arg) > beta
```
The fitted coefficients would then be written
to a file called `beta`.

Now you can make predictions with the model
as follows:
```
echoe "1 5 90" | bashml mlr beta
```
`echoe` is just a short hand for `echo -e`.
You may pass in many feature vectors to predict
in a batch to `mlr`.

Matrices are passed into commands as space-separated
columns and newline separated rows on stdin, or as an argument
using space separated columns and comma separated rows.
There is a convenience function called `arg` that
allows for conversion between stdin represenation and
arg representation.

# Command Reference

## ols
Fits a feature matrix and output vector using olr
and returns estimated coefficients for prediction. 
Fearure matrix is passed on stdin and output
vector on arg. Example:
```
echoe "3 3.5\n3.2 3.6" | bashml ols 1,2 > betatest
```

## mlr
Predicts using a MLR model trained with the ols
command. Feature matrix is input and name of
file that holds coefficent predictions from
ols is the only arg. Example:
```
echoe "1 5" | bashml mlr betatest
```

## ql
This command performs
Q-table based reinforcement learning.
A qtable can be initiated with:
```
bashml ql <ACTIONS> <STATES>
```
The output is a 0-filled matrix that should be passed
in to the command for training.
To train pass in the curretn qtable on stdin as follows:
```
echoe "$qtable" | bashml ql <action> <state> <reward> <next_state> <alpha> <gamma>

```
To make prediction pass in the qtable on stdin and the current state
as the only arg.
```
echoe "$qtable" | bashml ql <current_state>
```
The following example initializes a qtable with 3 actions and 3 states,
trains it by setting `reward` 0.234 for `action` 2 and `state` 3 and `next_state` 2,
with `alpha` 0.1 and `gamma` 0.1. Finally it predicts the best action to take in
state 3.
```
bashml ql 3 3 | bashml ql 2 3 0.234 2 0.1 0.1 | bashml ql 3
```

## id3
This command creates a decision tree encoded as a bash script.
To train a model you pass in a table with headers and the last
column as decision variable. E.g.
```
cat data/decision.dat | MAXLEVEL=5 bashml id3 > decision_tree.sh && chmod u+x decision_tree.sh
```
`MAXLEVEL` denotes the number of levels of the tree generated. The default is 10.
Predictions can then be made as follows:
```
Outlook=Rain Wind=Strong ./decision_tree.sh
```
All headers in the training table become environment variables during prediction.

## dt
This command makes a prediction for a decision tree model encoded as a bash script (see id3 command above).
The command takes as input on stdin a table with a header where the columns correspond to the parameters in
the model, and the path to the model file as the only command line argument. For example:
```
cat data/student_predict.dat | bashml dt data/student_scores_example_tree.sh
```

## rf
This command trains a random forest of ID3 trees:
```
cat data/student_scores.dat | bashml rf TREE_ID
```
where `TREE_ID` is the tree ID that needs to be used for predictions.

`TREE_COLUMNS` and `TREES` can be passed as environment variables
to specify how many feature columns should be samples in each tree
and how may trees should be generated, respectively.

To make predictions pass the environment variable `PREDICT=yes`
to pick the majority classification.
It is equivalent to the dt command for individual trees.
```
cat data/student_predict.dat | PREDICT="yes" bashml rf TREE_ID
```
where `TREE_ID` is the tree ID that was used during training.

## entropy
This command takes a two column table as input on stdin
and computes the entropy of column 1 on column 2.
```
echoe "1 2\n3 4" | bashml entropy
```
## gain
This command takes a two column table as input on stdin
and computes the information gain of all attribute values of column 1 on column 2.
```
echoe "1 2\n3 4" | bashml gain
```

## maxgain
This command takes a multi column table as input on stdin
and computes the column with max information gain on the last column.
```
echoe "1 2 4\n3 4 5" | bashml maxgain
```

## lr
This command trains and predicts with Logistic Regression models.
As input you pass in the feature matrix on stdin as a space separated
columns and line separated row table. The outcome vector which must be
of the same size as the number of rows in the feature matrix is passed
in as a command line argument where each element is separated by space.

To train a model use the following:
```
cat data/logreg_example.dat | ITERATIONS=2 bashml lr 1 0 1 0
```
It will output the model parameters, ofthen referred to as theta that
then can be passed in during predictions as follows:
```
cat data/logreg_test.dat | PREDICT="yes" bashml lr 0.0525194  -0.0092348  -0.01250607
```
Predictions are probabilities, where the returned vector elements correspond
to the rows in the input.

## dot
Computes the dot product of two vectors
passed in as rows in stdin format, e.g.:
```
echoe "1 2 3\n4 5 6" | bashml dot
```

## mult
Multiplies two matrices. First matrix
is passed in stdin format and second in
arg format, e.g.:
```
echoe "1 2 3\n4 5 6" | bashml mult 2,3,4
```

## invert
Computes the inverse of a matrix, e.g.:
```
echoe "3 3.5\n3.2 3.6" | bashml invert
```

## transpose
transposes a matrix, e.g.:
```
echoe "3 3.5\n3.2 3.6" | bashml transpose
```

## shufg
Portable equivalent to shuf. Randomizes order of lines passed on stdin.
```
echoe "1\n2\n3" | shufg
```

## bcg
Portable equivalent to bc. Performs floating point arithmetic
based on specified precision. Will use bc internally if available.
```
echo "scale=2;1.2/5.6" | bcg
```

## diffg
Portable equivalent to diff. Computes diff between content passed as stdin
and files passed as only argument.
```
cat file1 | bashml diffg file2 && "echo files are the same"
```

## General Notes
The `eliminate` and `identity` commands
are used internally by the `invert`command
and should not be used directly.

Calculations are by default done with
a precision of 10 decimal points.
To increase or decrease the precision
set the environment variable `BC_PRECISION`.
For example:
```
$ export BC_PRECISION=3
$ cat data/cases_distance.dat | bashml ols $(cat data/cases_distance_time.dat | arg)
-.148
-15.431
-.293
```
and
```
$ export BC_PRECISION=20
$ cat data/cases_distance.dat | bashml ols $(cat data/cases_distance_time.dat | arg)
8.56558125912730884008
1.19651629675990548845
-.00020177170092918113
```
As you can see from this example, setting the precision too low can
have drastic effects on the results as you are not just setting the precision
of the final output, but the precision of all internal calculations.

## Platform Notes

### MacOS
On MacOS it should work as is with the default bash shell.
It does not work with the sh shell. No additional setup
is needed.
### Ubuntu
On Ubuntu Linux it should work as is with the default bash shell.
It does not work with the sh shell. No additional setup
is needed.
### OpenWrt
On OpenWrt bash is not available by default but ash is compatible
and should be used instead.
It requires changing the shebangs on the scripts as follows:
```
sh change_shebang.sh "\/bin\/sh"
export SHEBANG="/bin/sh"
```
### Android
On Android in the ADB shell bash is not available but the default sh is compatible.
It requires changing the shebangs on the scripts as follows:
```
sh change_shebang.sh "\/system\/bin\/sh"
export SHEBANG="/system/bin/sh"
```
### Windows
On Windows the easiest way to get started is to install [Git-bash](https://git-scm.com/downloads).
No additional setup is needed, when in the git-bash shell.

### RaspberryPi
On RaspberryPi with Raspbian (tested with stretch and buster on Pi 3 Model B+ and Zero v1.3) 
it should work as is with the default bash shell.
No additional setup is needed.

## Tests
To run the regression tests after setup run:
```
./test/test
```
## Debugging and Tracing
Full tracing may be turned on with the environment variable
```
TRACE=yes
```
Tracing may also be turned on for individual scripts in
the scripts directory, e.g.
```
lrTRACE=yes
```

## Minimal Installs
If library foorprint is a concern each model can be used separately and only
its dependencies need to be pushed to the device.
The bin and script directories are needed for all commands, but the data
and test directories are only needed for testing.
All commands need the bcg script. In addition the model dependencies with
footprint are as follows:

- mlr 6320 bytes (ols,earg,dot,eliminate,identity,etranspose,invert,mult,transpose)
- dt 5572 bytes (entropy,gain,maxgain,id3) 
- rf 7936 bytes (dt,shufg,rfp,rft) 
- lr 2304 bytes
- ql 2689 bytes 

## Installation and Distribution
To stage the scripts on the target platform there are a couple
of scripts to help with installation and distribution.
By running:
```
./create_installer.sh
```
This will create an installer in the `dist` directory.
Now a web server can be started to host the installer
with:
```
./serve_installer.sh <PORT>
```
Note, this server requires python3 but has no other dependencies.

At this point, you can install bashml on a target device with:
```
curl -s http(s)://<HOST>:<PORT>/installer.sh | bash
```
The installation does not install any packages, but simply unbundles
the self-contained installer script into the bashml scripts locally.
The only dependency of the installer itself is bash (and curl, if executed as above).
The installer will also, when run, create a `.env` file that can be sourced
to set up the path to the bashml installation.

## Selective Installs
If you don't want to install all models on the target platform you can choose to
only download and install a selection. 
To only provide the MLR model in the installer you can run:
```
ENABLE_ALL=no ENABLE_MLR=yes ./create_installer.sh
```
The following selective installs are currently supported:
- `ENABLE_MLR`
- `ENABLE_DT`
- `ENABLE_RF`
- `ENABLE_LR`
- `ENABLE_QL`

If `ENABLE_ALL` is set to `yes` (default) all models will be included in the installer.

## TODO
- Can we build a simple neural network with backpropagation using this
technique too, or at least execute a pre-learned NN?
- Can we make performance optimization, e.g. dot product caching?
- How do we allow federated learning on top of the models to distribute the learning?
- Standardize the model format so that learning can be done with another framework
- Python equivalent companion to train models to be executed by bashML
