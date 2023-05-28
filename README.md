# FULL-CI-CD-ITI-PROJECT
## overview
Created a private EKS cluster on AWS using Terraform and containerized a simple web app with Docker. Automated
software installations and implemented Jenkins deployments using Ansible. Created a Jenkins pipeline to
containerize code from GitHub and deploy it to the EKS cluster.

## Tools Used
* Docker Platform
* Kubernetes
* Terraform
* Ansible
* Jenkins
* Amazon Web Service (AWS)

## Steps
* Build simple web app
* Create simple web app dockerfile
* Create infrastructure using Terraform
* Use ansible to configure bastion Host
* Use ansible to deploy Jenkins deployment
* Configure Jenkins to use bastion host as a slave
* Create jenkins pipline to do:
    * Build the Dockerfile and push it to dockerhub repository
    * Deploy the app in kubernetes cluster using the image

