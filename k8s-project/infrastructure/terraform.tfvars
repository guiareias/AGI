#####################################################################
# the terraform.tfvars file is ignored in git Repo
#####################################################################
# How to define variables in terraform:
# https://www.terraform.io/docs/configuration/variables.html

# # Define the Project ID
project = "agisit-2021-project-a43"

# Define the default number of Nodes for the cluster
workers_count = "2"

# Define the Region/Zone
# Regions list is found at:
# https://cloud.google.com/compute/docs/regions-zones/regions-zones?hl=en_US
region = "europe-west3-b"