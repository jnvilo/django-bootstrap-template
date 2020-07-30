#!/bin/bash

if [ ! -z "venv" ]
then
	virtualenv venv
fi

if [ -a "./web/requirements.txt" ]
then
	pip install -r /web/requirements.txt
fi
