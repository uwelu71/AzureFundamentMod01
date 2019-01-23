#!/bin/bash


# Create a public IP address.
az network public-ip create --resource-group ulu-demo01-t-we-rg --name uludm02lx01-pip

# Create a virtual network card and associate with public IP address and NSG.
az network nic create \
  --resource-group  ulu-demo01-t-we-rg\
  --name uludem01lx02-nic1 \
  --vnet-name uludm01-vnet \
  --subnet uludm01-vnet-sub01 \
  --network-security-group uludem01-lxapp-nsg \
  --public-ip-address uludm02lx01-pip

# Create a new virtual machine, this creates SSH keys if not present.
az vm create --resource-group ulu-demo01-t-we-rg --name uludem01lx02 --nics uludem01lx02-nic1 --image UbuntuLTS --generate-ssh-keys