#!/bin/bash

# Delaying for a moment to make sure every services available
sleep 3
busctl --user -- set-property rs.wl-gammarelay / rs.wl.gammarelay Temperature q 8500