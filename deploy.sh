#!/bin/bash

export SERVICE_NAMESPACE=
env > .env

for manifest in `ls *.yaml`
do 
    oc process -f $manifest --param-file=.env --ignore-unknown-parameters=true | oc apply -f -
done
