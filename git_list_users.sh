#!/bin/bash

################
# About: This script will return the users with read access to Github repository

# Input: 1. Name of organization, 2. Name of repository, 3. Git Username 4. Access token

# Author: Suyog

# Version: 2
################

helper()

# Github API URL
API_URL="https://api.github.com"

#Github username & personal access token
USERNAME= $userame
TOKEN= $token

#User & Repository info
REPO_OWNER=$1
REPO_NAME=$2

#Function to make a GET request to the Github API

function github_api_get{
	local endpoint="$1"
	local url="${API_URL}/${endpoint}"
	
	#send a GET request to the Github API with authentication
	curl -s -u"${USERNAME}:${TOKEN}" "$url"
	}

#Fetch the list of users with read access to the repository
function list_users_with_read_access{
	local endpoint="repo/${REPO_OWNER}/${REPO_NAME}/collaborators"

	#Fetch the list of collaborators on the repository
	collaborators="$(github_api_get "$endpoint" | jq -r '.[] | select(.permission.pull==true)|login')"

	if[[-z "$collaborator" ]]; then
		echo "No users with read access to ${REPO_OWNER}/${REPO_NAME}."
	else
		echo "Users with read access to ${REPO_OWNER}/${REPO_NAME}:"
		echo "$collaborators"
	fi
	}

#Function to inform user to provide valid cmd arguments
function helper{
	local cmd_args=2
	if[[$# -ne cmd_args]]; then
		echo"Provide valid arguments, scriptname.sh organization_name repo_name"
		echo "asd"




#Main Script
echo"Listing users with read access to ${REPO_OWNER}/${REPO_NAME}.."
list_users_with_read_access





