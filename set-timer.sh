#!/bin/bash

date -d "now + $1" +%s > ~/.future.txt
