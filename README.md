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
* create simple web app
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

### add configuration using ansible
* Run ansible playbook to add configuration to bastion host and deploy jenkins deployment.
```
 ansible-playbook jenkins.yaml
```

### Connect to bastion
* Run this command, if necessary, to ensure your key is not publicly viewable.
```
chmod 400 bastion.pem
```
* Connect to your instance using its Public IP.
```
ssh -i "bastion.pem" ubuntu@<Public IP>
```

### login to jenkins
* Run the following command inside bastion instance to extract public DNS for the jenkins service  "under external ip header".
```
kubectl get svc -n jenkins
```

* Hit the URL in any browser after add 8080 port to the URL, it will be like the following URL 
```
a3b8b4a640d6b452898107eaea34bafc-1771988427.us-east-1.elb.amazonaws.com:8080
```
