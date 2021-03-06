# fantastic-rotary-phone

Terraform repo for the [Udemy Certified Kubernetes Security Specialist from Killer Shell](
https://www.udemy.com/course/certified-kubernetes-security-specialist/)


## Installing
A GCP service account key: Create a service account key to enable Terraform to access your GCP account. When creating the key, use the following settings:

Select the project you created in the previous step.
Click "Create Service Account".
Give it any name you like and click "Create".
For the Role, choose "Project -> Editor", then click "Continue".
Skip granting additional users access, and click "Done".
After you create your service account, download your service account key.

Select your service account from the list.
Select the "Keys" tab.
In the drop down menu, select "Create new key".
Leave the "Key Type" as JSON.
Click "Create" to create the key and save the key file to your system.

https://console.cloud.google.com/projectselector/iam-admin/serviceaccounts?supportedpurview=project


    terraform apply -var-file=secret.tfvars --auto-approve

## Removing

Use terraform destroy to remove instances

    terraform destroy -var-file=secret.tfvars --auto-approve

## Gotchas

You may get an error to say the Nodes are not ready and coredns remains in a stuck state.  Look for errors similar to this in /var/log/syslog:

```
Jul  4 12:43:21 cks-primary kubelet[12208]: E0704 12:43:21.625949   12208 kubelet.go:2386] 
"Container runtime network not ready" networkReady="NetworkReady=false reason:NetworkPlugin
NotReady message:Network plugin returns error: cni plugin not initialized"
```

This is because the [killer.sh startup script](https://raw.githubusercontent.com/killer-sh/cks-course-environment/master/cluster-setup/latest/install_master.sh) does not always install CNI properly, so re-run the correct part of the install script.

```
### CNI
kubectl apply -f https://raw.githubusercontent.com/killer-sh/cks-course-environment/master/cluster-setup/calico.yaml
```
Shutting down instances:

```
# gcloud compute instances stop cks-primary
# gcloud compute instances stop cks-secodary
```
