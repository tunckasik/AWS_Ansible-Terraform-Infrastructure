# AWS_Ansible-Terraform-Infrastructure

This Terraform project creates 4 Ansible Machines on Amazon EC2 instances. 
The Ansible machines will run on Amazon Linux 2 and Ubuntu 20.04, and they come with a custom security group that allows SSH (port 22) and HTTP (port 80) connections from anywhere. 
Users need to select the appropriate variables from the tfvars file when launching the instances.

## Requirements
    - Terraform v1.1 or higher
    - AWS CLI v2.x
    - An AWS account with the necessary permissions to create resources

## Ansible Configuration
This project includes an Ansible configuration file (ansible.cfg) settings. These settings disable host key checking, set the default inventory file to ```inventory.txt```, suppress deprecation warnings, and automatically choose the appropriate Python interpreter silently.

The ```ansible.cfg``` file is automatically uploaded to the control node during the Terraform provisioning process. If you need to modify these settings, update the ansible.cfg file in the project's root directory before running terraform apply.

## Usage
1. Clone this repository:

```bash
git clone https://github.com/tunckasik/AWS_Ansible-Terraform-Infrastructure
cd AWS_Ansible-Terraform-Infrastructure
```

1. Update the terraform.tfvars file with your desired variables:

```makefile
region       = "us-east-1"
myami        = ["ami-0b0dcb5067f052a63", "ami-0b0dcb5067f052a63", "ami-0b0dcb5067f052a63", "ami-0a6b2839d44d781b2"]
instancetype = "t2.micro"
num          = 4
mykey        = "your_key_name"
tags         = ["control-node", "web-node1", "web-node2", "ubuntu-node"]
```
You must replace `your_key_name` with your own key-name and optionally other the values with your own choices for the AWS region, AMI IDs, instance type, number of instances, and tags.

1. Initialize, plan and apply the Terraform configuration:
```
terraform init
terraform plan
terraform apply -auto-approve
```

1. Access the control node and verify the setup:

```typescript
ssh -i ~/.ssh/your_key_name.pem ec2-user@control_node_ip
```
1. Replace your_key_name with the name of your key pair and control_node_ip with the public IP address of the control node, which can be found in the Terraform output.

1. To destroy the resources when you're done:

```
terraform destroy
```
Type *yes* when prompted to confirm the destruction of resources.

#### Notes
Make sure to correctly define your key file path in the null_resource.config block.
The control_node_ip output displays the public IP address of the control node, which you can use to SSH into the instance.