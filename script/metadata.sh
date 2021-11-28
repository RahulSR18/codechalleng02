#!/bin/bash
echo "checking json processor package"
if 
  ! rpm -qi jq
  then
  echo "Package jq is not installed,Installing package."
  yum install epel-release -y
  yum update -y
  yum install jq -y
else
  echo "package is already installed"
fi

# Get all metadata
curl -H Metadata:true --noproxy "*" "http://169.254.169.254/metadata/instance/compute?api-version=2021-01-01&format=json" | jq

# Get instance os profile
curl -H Metadata:true --noproxy "*" "http://169.254.169.254/metadata/instance/compute/osProfile?api-version=2021-01-01&format=jso
n" | jq

# Get storage profile
curl -H Metadata:true --noproxy "*" "http://169.254.169.254/metadata/instance/compute/storageProfile/dataDisks?api-version=2021-0
1-01&format=json" | jq

# Get network details
curl -H Metadata:true --noproxy "*" "http://169.254.169.254/metadata/instance/network?api-version=2021-01-01&format=json" | jq

# Get ip address
curl -H Metadata:true --noproxy "*" "http://169.254.169.254/metadata/instance/network/interface/0/ipv4/ipAddress?api-version=2021
-01-01&format=json" | jq