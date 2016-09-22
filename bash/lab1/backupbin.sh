#!/bin/bash
# This script backups up my personal bin to my personal backups directory

rsync -av ~/bin/ ~/backups
