#!/bin/bash
# az login

# Create a resource group.
az group create --name ulu-demo01-t-we-rg --location westeurope

# Create a virtual network.
az network vnet create --resource-group ulu-demo01-t-we-rg --name uludm01-vnet 

# Create a network security group for Linux hosts
az network nsg create --resource-group ulu-demo01-t-we-rg --name uludem01-lxapp-nsg

# Create a network security group for Windows hosts
az network nsg create --resource-group ulu-demo01-t-we-rg --name uludem01-winapp-nsg

# Create a subnet

az network vnet subnet create \
  --resource-group uludem01-t-we-rg \
  --vnet-name uludm01-vnet \
  --name uludm01-vnet-sub01 \
  --address-prefix 10.1.0.0/24 \
  --network-security-group uludem01-lxapp-nsg

az network vnet subnet create \
  --resource-group uludem01-t-we-rg \
  --vnet-name uludm01-vnet \
  --name uludm01-vnet-sub02 \
  --address-prefix 10.2.0.0/24 \
  --network-security-group uludem01-winapp-nsg






# Create a network security group for Windows hosts
az network nsg create --resource-group ulu-demo01-t-we-rg --name uludem01-winapp-nsg