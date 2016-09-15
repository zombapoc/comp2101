#!/bin/bash
# This script backups up my personal bin top my personal backups directory
# not really a good backup though, just links in ~/bin

rsync -avr ~/bin ~/backups
