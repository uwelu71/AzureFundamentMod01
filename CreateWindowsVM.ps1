#Connect to default Azure subscription
Connect-AzAccount

#Create ResourceGroup
New-AzResourceGroup -Name TutorialResources -Location eastus

#Enter Credentials for CM you will create
$cred = Get-Credential -Message "Enter a username and password for the virtual machine."

#Parameters for VM you will create
$vmParams = @{
  ResourceGroupName = 'ulu-demo01_RG'
  Name = 'uludm01srv01'
  Location = 'westeurope'
  ImageName = 'Win2016Datacenter'
  PublicIpAddressName = 'ulu-dem01-PublicIp'
  Credential = $cred
  OpenPorts = 3389
}
$newVM1 = New-AzVM @vmParams

# Create VM
$newVM1