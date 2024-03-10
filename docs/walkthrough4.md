## Walkthrough  - Internet access through an Azure Firewall VM access through Azure Bastion
What we're going to deploy:
<pre>
<img align="left" src="../images/deploy04.png"></br>
</pre>
---


This time we are going to add an Azure Firewall and route Internet traffic through it.

Concepts
Azure Firewall summary + link
Azure Firewall rules can be applied directly to the firewall, or they can be configured as a separate resource - Azure Firewall Policy.  Firewall Policy resources allow rules to be applied to multiple firewalls, but do have an associated cost.

We also need other resources:  Azure Firewalls have to be deployed into a subnet named "AzureFirewallSubnet".  This could be in our existing virtual network, but it is more common to place connectivity devices, such as Azure Firewall in a spoke virtual network of a hub and spoke topology.  So, we will also create a new virtual network to contain the "AzureFirewallSubnet".

In Azure, communication between subnets in the same Virtual Network is in place by default.  Communication between different virtual networks requires "peering", so we must also create this peering.

Rather than configure a DNAT rule to allow our SSH access to the deployed hosts, we'll make use of Azure Bastion

Our VMs, as well as any other resources we deploy into virtual networks, need routes configured to direct traffic to the Azure Firewall.  In Azure this is done by configuring a Route Table resource and attaching it to required subnets.

