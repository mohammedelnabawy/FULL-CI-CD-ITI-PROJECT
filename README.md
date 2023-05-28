# FULL-CI-CD-ITI-PROJECT
## overview
Created a private EKS cluster on AWS using Terraform and containerized a simple web app with Docker. Automated
software installations and implemented Jenkins deployments using Ansible. Created a Jenkins pipeline to
containerize code from GitHub and deploy it to the EKS cluster.
![Screenshot from 2023-05-28 14-25-39](https://github.com/mohammedelnabawy/FULL-CI-CD-ITI-PROJECT/assets/46055709/f0e85e97-1b80-4fb7-8071-e595a630191b)
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
![Screenshot from 2023-05-28 16-10-49](https://github.com/mohammedelnabawy/FULL-CI-CD-ITI-PROJECT/assets/46055709/9974d178-d835-427b-a24d-eaed976fb3ec)

* Run the following command to extract the jenkins password
```
kubectl exec -it pod/<pod name> -n jenkins -- cat /var/jenkins_home/secrets/initialAdminPassword
```
* install the recommended plugins.
![Screenshot from 2023-05-28 16-15-38](https://github.com/mohammedelnabawy/FULL-CI-CD-ITI-PROJECT/assets/46055709/447fe438-729c-4b7a-9a99-7971cb7ec197)

* Create first admin user.
![Screenshot from 2023-05-28 16-16-13](https://github.com/mohammedelnabawy/FULL-CI-CD-ITI-PROJECT/assets/46055709/21e94869-d637-4bef-8efe-2373e89cf5fe)

* Jenkins URL
![Screenshot from 2023-05-28 16-16-21](https://github.com/mohammedelnabawy/FULL-CI-CD-ITI-PROJECT/assets/46055709/f891d68c-9428-4f7b-a2db-d46d33ed3904)

* Get started
![Screenshot from 2023-05-28 16-16-30](https://github.com/mohammedelnabawy/FULL-CI-CD-ITI-PROJECT/assets/46055709/f940e8e2-5a99-464b-b5d8-09afe6af41c3)

* Create slave SSH credintial
![Screenshot from 2023-05-28 16-28-07](https://github.com/mohammedelnabawy/FULL-CI-CD-ITI-PROJECT/assets/46055709/69766e1a-f290-4661-a1ff-b6a35c1337ee)

* Create Remote Slave
![Screenshot from 2023-05-28 16-30-45](https://github.com/mohammedelnabawy/FULL-CI-CD-ITI-PROJECT/assets/46055709/5ebb8209-e3a2-4b46-9308-5afbd27cf384)
![Screenshot from 2023-05-28 16-39-37](https://github.com/mohammedelnabawy/FULL-CI-CD-ITI-PROJECT/assets/46055709/8273c00f-81a1-4507-a1a8-b504b602d6b4)

* Create GitHub credintial
![Screenshot from 2023-05-28 17-06-11](https://github.com/mohammedelnabawy/FULL-CI-CD-ITI-PROJECT/assets/46055709/4e7f4a80-6f45-49e8-a9d5-4614048e14ca)

* Create Docker credintial
![Screenshot from 2023-05-28 17-09-29](https://github.com/mohammedelnabawy/FULL-CI-CD-ITI-PROJECT/assets/46055709/7b5e4f35-af20-4c24-93b7-6c71aea34e28)

* Create web-app-pipline
![Screenshot from 2023-05-28 17-11-09](https://github.com/mohammedelnabawy/FULL-CI-CD-ITI-PROJECT/assets/46055709/aa815374-e558-40bc-9c4a-9f8150032dfd)

* GitHub hook trigger for GITScm polling
![Screenshot from 2023-05-28 17-12-21](https://github.com/mohammedelnabawy/FULL-CI-CD-ITI-PROJECT/assets/46055709/32f3e732-be0f-4620-8c42-5ae7d1a5e3a5)

* Add github repo info
![Screenshot from 2023-05-28 17-12-27](https://github.com/mohammedelnabawy/FULL-CI-CD-ITI-PROJECT/assets/46055709/60b16e02-b8e6-4d85-a180-ba097024e24d)

* Add webhook to your simple app repo
![Screenshot from 2023-05-28 17-36-49](https://github.com/mohammedelnabawy/FULL-CI-CD-ITI-PROJECT/assets/46055709/91b0ed2e-c530-4c32-9c8f-f05a62810c67)

* After every push the pipline will be run
![Screenshot from 2023-05-28 17-45-03](https://github.com/mohammedelnabawy/FULL-CI-CD-ITI-PROJECT/assets/46055709/2842870b-84f3-47fc-bc7d-47bacd4e5624)

* Run the following command inside bastion instance to extract public DNS for the web app service  "under external ip header".
```
kubectl get svc -n simple-web
```

* Hit the URL in any Browser, it will be like the following URL 
```
afe4b9faa6cb84ebb9bc45dda2643741-847267762.us-east-1.elb.amazonaws.com
```
![Screenshot from 2023-05-28 17-46-36](https://github.com/mohammedelnabawy/FULL-CI-CD-ITI-PROJECT/assets/46055709/97c0a5e9-d250-4616-8216-6c5ca0b3d5d2)
