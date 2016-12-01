#!/bin/bash

# set path dirname "$0"
# ./cli.sh test 1

MY_PATH=`dirname "$0"`
MY_PATH=`( cd "$MY_PATH" && pwd  )`
$MY_PATH/tool.sh test 1
