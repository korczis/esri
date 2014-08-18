#! /usr/bin/env bash

# Fetching links
bundle exec ruby ./main.rb | tee links.txt

# aria2c -i links.txt -x 16 --dir=data