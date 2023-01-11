#!/bin/bash

PYTHON=`which python`
PYTHON3=`which python3`

if [ $PYTHON ]; then
	python file.py
elif [ $PYTHON3 ]; then
	python3 file.py
else
	echo "sem python"
fi