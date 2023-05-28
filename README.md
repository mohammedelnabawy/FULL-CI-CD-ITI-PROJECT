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

### simple web app
* You can find the web app and the dockerfile in the folowing repo:
```
https://github.com/mohammedelnabawy/simple-web-app
```

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

### Configure Jenkins
* Run the following command inside bastion instance to extract public DNS for the jenkins service  "under external ip header".
```
kubectl get svc -n jenkins
```

* Hit the URL in any browser after add 8080 port to the URL, it will be like the following URL 
```
a3b8b4a640d6b452898107eaea34bafc-1771988427.us-east-1.elb.amazonaws.com:8080
```
![Screenshot from 2023-05-28 16-10-49](https://github.com/mohammedelnabawy/FULL-CI-CD-ITI-PROJECT/assets/46055709/ae63ccf4-4f82-4743-9371-d004b67c57c1)

* Run the following command to extract the jenkins password
```
kubectl exec -it pod/<pod name> -n jenkins -- cat /var/jenkins_home/secrets/initialAdminPassword
```
* install the recommended plugins.
![Screenshot from 2023-05-28 16-15-38](https://github.com/mohammedelnabawy/FULL-CI-CD-ITI-PROJECT/assets/46055709/946172a7-72a9-4f76-a7db-e93f2281be7b)

* Create first admin user.
![Screenshot from 2023-05-28 16-16-13](https://github.com/mohammedelnabawy/FULL-CI-CD-ITI-PROJECT/assets/46055709/b311abcf-c8c3-4470-ae54-a699711e2cca)

* Jenkins URL
![Screenshot from 2023-05-28 16-16-21](https://github.com/mohammedelnabawy/FULL-CI-CD-ITI-PROJECT/assets/46055709/b47353cb-b744-4289-b80c-154438bc8bbb)

* Get started
![Screenshot from 2023-05-28 16-16-30](https://github.com/mohammedelnabawy/FULL-CI-CD-ITI-PROJECT/assets/46055709/23cf5cab-c151-454d-9cde-388c077bf981)

* Create slave SSH credintial
![Screenshot from 2023-05-28 16-29-18](https://github.com/mohammedelnabawy/FULL-CI-CD-ITI-PROJECT/assets/46055709/73ad3ea1-5d98-4d4c-a919-cd41fc61861d)

* Create Remote Slave
![Screenshot from 2023-05-28 16-39-37](https://github.com/mohammedelnabawy/FULL-CI-CD-ITI-PROJECT/assets/46055709/e720b263-2ea9-4e6d-b0d4-c08050bd2c39)

* Create GitHub credintial
![Screenshot from 2023-05-28 17-06-11](https://github.com/mohammedelnabawy/FULL-CI-CD-ITI-PROJECT/assets/46055709/7462de2e-f277-4373-8808-57ed2dcbe01d)

* Create Docker credintial
![Screenshot from 2023-05-28 17-09-29](https://github.com/mohammedelnabawy/FULL-CI-CD-ITI-PROJECT/assets/46055709/5564b42a-c2c4-45f9-9309-91828b944019)

* Create web-app-pipline
![Screenshot from 2023-05-28 17-11-09](https://github.com/mohammedelnabawy/FULL-CI-CD-ITI-PROJECT/assets/46055709/8f26f88d-a750-40ec-9457-cfe7fbacaa0d)

* GitHub hook trigger for GITScm polling
![Screenshot from 2023-05-28 17-12-21](https://github.com/mohammedelnabawy/FULL-CI-CD-ITI-PROJECT/assets/46055709/918e7f5a-0407-4549-b92d-c3cc5754605f)

* Add github repo info
![Screenshot from 2023-05-28 17-12-27](https://github.com/mohammedelnabawy/FULL-CI-CD-ITI-PROJECT/assets/46055709/93b9e676-cd4b-4c9d-8204-6b1342a92062)

* Add webhook to your simple app repo
![Screenshot from 2023-05-28 17-36-49](https://github.com/mohammedelnabawy/FULL-CI-CD-ITI-PROJECT/assets/46055709/91591722-31c1-4cad-8266-d5a7044d2cab)

* After every push the pipline will be run
![Screenshot from 2023-05-28 17-45-03](https://github.com/mohammedelnabawy/FULL-CI-CD-ITI-PROJECT/assets/46055709/c509ffb6-9cd9-4a02-b9f2-6dfab2744969)

* Run the following command inside bastion instance to extract public DNS for the web app service  "under external ip header".
```
kubectl get svc -n simple-web
```

* Hit the URL in any Browser, it will be like the following URL 
```
afe4b9faa6cb84ebb9bc45dda2643741-847267762.us-east-1.elb.amazonaws.com
```
![Screenshot from 2023-05-28 17-46-36](https://github.com/mohammedelnabawy/FULL-CI-CD-ITI-PROJECT/assets/46055709/cb3128e2-158c-4ed1-b8f1-f8147ff37098)
