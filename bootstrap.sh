#!/bin/bash

case $(id -u) in
    0) 
         echo first: running as root
         echo doing the root tasks...
         apt-get update
         apt-get install -y git htop screen rng-tools
         sudo -u vagrant -i $0  # script calling itself as the vagrant user
         ;;
    *) 
         echo then: running as vagrant user
         echo doing the vagrant user tasks
         git clone -b liberty_bug_1598525 https://github.com/zioproto/devstack
         cd devstack/
         cp samples/local.conf .
         #./stack.sh
         ;;
esac
