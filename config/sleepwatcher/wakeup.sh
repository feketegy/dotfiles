#!/usr/bin/env bash

# THIS IS INTENDED TO RUN WITH SLEEPWATCHER ON WAKEUP

# HACK: Stop the dock app jumping from one display to another and still have the "Displays have separate spaces" option enabled with this hack, 
# the dock will stay on the main display for 60 seconds while the cursor is at the area on another display where the dock would be placed.
# If the 60 seconds elapsed and the cursor doesn't move, the dock will be moved where the cursor is.
defaults write com.apple.dock autohide-delay -float "60"
