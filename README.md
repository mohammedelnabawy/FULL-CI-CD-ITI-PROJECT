# FULL-CI-CD-ITI-PROJECT
## overview
Created a private EKS cluster on AWS using Terraform and containerized a simple web app with Docker. Automated
software installations and implemented Jenkins deployments using Ansible. Created a Jenkins pipeline to
containerize code from GitHub and deploy it to the EKS cluster.
![Screenshot from 2023-05-28 14-25-39](https://github.com/mohammedelnabawy/FULL-CI-CD-ITI-PROJECT/assets/46055709/42da2742-2c06-4ccd-ab34-804a41019768)

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

### infrastructure using Terraform
* Run terraform init command to initializes a Terraform working directory.
```
terraform init
```
* Run terraform plan command to creates an execution plan.
```
terraform plan
```
* Run terraform apply command to apply the changes defined in your Terraform configuration files to your infrastructure resources.
```
terraform apply
```
* Run terraform destroy command to destroy your infrastructure resources after you finish.
```
terraform destroy
```


