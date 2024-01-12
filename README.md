## Introduction
This repo is the work in progress for an upcoming talk covering basic aspects of Azure networking and Terraform IaC.

The .tf files have been designed so that they can be, in effect, commented out by renaming the .tf extension leaving a working repo that will deploy with ```terraform apply```

The prerequesites to installing are an Azure account and installed Terraform.

---
**_NB:_** The resources deployed **_will_** incur Azure costs.  No responsibility is accepted for bill shock.  Remember to ```terraform destroy``` if using this repo for test, learning or demo.

---
## TLDR
The talk consists of a series of live deployments to an Azure resource group.  There's a detailed walkthrough (coming!) below.  What will be covered:
* [Deploying a VM into a Virtual network with defaults settings](/docs/walkthrough1.md)
* [Adding an NSG. Internet access basics for Azure VMs](/docs/walkthrough2.md)

* Use of NAT Gateway.
* Use of Azure Route Tables and Azure Firewall.

---
