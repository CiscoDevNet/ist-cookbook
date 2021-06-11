# Deploying Compute using Cisco Intersight Service for HashiCorp Terraform

## Overview

Cisco Intersight Service for HashiCorp Terraform (IST) addresses the challenge of securely connecting and configuring on-premises and hybrid environments to work with Terraform Cloud Business Tier. Leveraging Intersight Assist, users can integrate Terraform Cloud Business with Cisco Intersight, enabling secure communication between on-premises data centers and edge locations with the IaC platform. This means users can spend less time managing the end-to-end lifecycle of Terraform Cloud Agents, benefiting from native integration directly within Intersight, including upgrades and the ability to scale as demand grows.

In this example, we cover a simple use case that the Intersight Platform and Terrraform Cloud Business Tier to deploy virtual machines on-premise. This use case will walk the user through the following steps.

1. Adding your Terraform Cloud for Business Tier Credentials
2. Adding your Terraform Cloud Agent
3. Executing Terraform Code to deploy virtual machines


## Requirements

1. Intersight SaaS platform account with Advantage licenses
2. An Intersight Assist appliance that is connected to your Intersight environment
3. Terraform Cloud Business Tier Account
4. vCenter Server Access
5. DHCP server to allocate ip addresses dynamically
5. GitHub account to host your Terraform code


## Steps to Deploy Use Case


### Setup Terraform Cloud Business Tier Account

To add your Terraform Cloud credentials in Intersight you will need the following:
1. Terraform Cloud Username
2. Terraform Cloud API Token
3. Terraform Cloud Organization

Login to Intersight and claim your Terraform Cloud target.

### Claim Terraform Agent

Once the target is created, the agent can be added assist. 

### Create GitHub Repo

1. Go to https://github.com/CiscoDevNet/ist-cookbook/tree/main/vm_provision
2. Fork it into your own GitHub account

#### Datacenter Prep

Create a template for a linux VM. This could be either CentOS or Ubuntu. Make sure you have VMware tools pre installed on the VM. We will use this template to a create a VM in the datacenter.



### Create Workspace in Terraform Cloud

1. Create a new worspace and choose a version control provider (setup in the previous step) that hosts the Terraform configuration for this workspace. 
2. Go to the Variables section and add the following variables with the value specific to your environment (the values provided below are examples)

| Key                |   Value          | Type         |
|--------------------|------------------|--------------|
| vsphere_server | 10.x.x.x||
| vsphere_user | administrator@vsphere.local||
| vsphere_password | ******** | Sensitive |
| datacenter | SJC19 ||
| resource_pool | IntersightPool ||
| datacenter | SJC19 ||
| resource_pool | IntersightPool ||
| datastore_name | nfs-datastore-0 ||
| network_name | vlan1238 ||
| template_name | MO-CENTOS7"
| vm_prefix | momagic ||
| vm_folder | momagic ||
| vm_count | 2 ||
| vm_domain | cisco.com ||
| vm_cpu | 2 ||
| vm_memory | 2048 ||

 ![Queue Terraform Plan](images/TFVariables.png)

### Execute Deployment

To execute the Terraform code in your datacenter click on the ***Queue Plan Manually*** button 
    ![Queue Terraform Plan](images/queueTFPlan.png)

## Results

You will see 2 virtual machines created 

## Related Sandbox

Get hands on experience with Intersight Service for Terraform in DevNet's Sandbox environment.

[Cisco Intersight Service for HashiCorp Terraform](https://devnetsandbox.cisco.com/RM/Diagram/Index/055e2dce-fdfd-4d26-a112-72b884ddd7c7?diagramType=Topology)

## Links to DevNet Learning Labs

Learn how to provision virtual machines in vSphere using Intersight Service for Terraform.

[Introduction to Intersight Service for Hashicorp Terraform](https://developer.cisco.com/learning/lab/intersight-01-ist-introduction/step/1)
[Provisioning VMs using Intersight Terraform Service for Hashicorp](https://developer.cisco.com/learning/lab/intersight-02-ist-vm-automation/step/1)



