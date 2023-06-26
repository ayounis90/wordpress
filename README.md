# WordPress Deployment with DevOps Tools & workflows

## Overview

This project's goal is to deploy a simple WordPress site in AWS using:

- Terraform
- Ansible
- Packer
- Jenkins 
- Git

## Build Image

We will first start out by building an image of the EC2 instance that we will be deploying using HashiCorp Packer

All configurations will be done using Ansible for configuring the image to create an Amazon Machine Image (AMI).

## Buld Infrastructure

This section will cover creating the infrastructure in AWS using Terraform.

### AWS Network & VPC

We will use an AWS module to create a VPC and setup additional resources such as security groups, IGW, route tables, etc. 

### AWS Setup Storage

Setup basic MySQL Database then finish configuring via Ansible if necessary.

## Deploy all code via Jenkins and Github integration

All the code generated from the above sections will be saved in a Github public repository and then first tested and deployed via Jenkins.
