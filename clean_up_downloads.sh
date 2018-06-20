#!/bin/bash

find ~/Downloads -mtime +7d -exec mv '{}' ~/.Trash \;
