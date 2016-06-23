#!/usr/bin/ksh

# set the folder for testing files
TEST_DIR=filtering
mkdir -p $TEST_DIR


# =========================== start of the questions =========================

echo "------------------------------------------------------------------------"
echo "1. Write a single shell command line that prints the names of all"
echo "C/C++ header files in the current directory and all its subdirectories"
echo "that contain the string typedef or the string struct"
echo 

# Requirements:
# 1.1 single shell command line
# 1.2 prints only the file names  -->  -l
# 1.3 all C/C++ header files  --> --include="*.h"
# 1.4 current directory and all its subdirectories --> -R
# 1.5 contains string "typedef" or "struct"  --> "typedef\|struct"

# create test files
echo "typedef abc 123" |tee $TEST_DIR/1.txt $TEST_DIR/1.h
echo "abc struct 123" |tee $TEST_DIR/2.txt $TEST_DIR/2.h
echo "abc 123" |tee $TEST_DIR/3.txt $TEST_DIR/3.h
echo "abc 123 typedef struct" |tee $TEST_DIR/4.txt $TEST_DIR/4.h


echo "command:"
filtering_1='grep -R -l --include="*.h" "typedef\|struct" .'
echo $filtering_1
echo 

echo "result:"
eval $filtering_1
echo 

echo "------------------------------------------------------------------------"
echo "2. Write a pipelined command that prints the names and sizes of all"
echo "regular files in the current directory and all its subdirectories that"
echo "were last modified less than two days ago, and have the .exe extension"
echo 

# Requirements:
# 1.1 pipelined command --> |
# 1.2 prints file names and size  --> stat --printf="file=%n, size=%s"  
# 1.3 all regular exe files  --> find -iname "*.exe"
# 1.4 current directory and all its subdirectories --> 
# 1.5 last modified within two days  --> -mtime -2

# create the test exe files' last modified time
for t in 1 2 3; do touch -d "$t day ago" filtering/$t.exe; done


echo "command:"
filtering_2='find -iname "*.exe" -mtime -2 |xargs stat --printf="file=%n, size=%s\n"'
echo $filtering_2
echo 

echo "result:"
eval $filtering_2
echo 

echo "------------------------------------------------------------------------"
echo ""
echo ""
echo ""
echo 

# Requirements:
# 1.1 
# 1.2 
# 1.3 
# 1.4 
# 1.5 

# create the test files


# build the command
echo "command:"
filtering_=''
echo $filtering_
echo 

echo "result:"
eval $filtering_
echo 
