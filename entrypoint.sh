#!/bin/bash
#

RACK_ENV=development JETS_ELB=1 JETS_ENV=development bundle exec jets server --port 80 --host 0.0.0.0

