#!/bin/bash

sed 's/\\n/\n/g' certificate.pem | tee new1.pem
