Connect-AzAccount
New-AzResourceGroup -Name TutorialResources -Location eastus
$cred = Get-Credential -Message "Enter a username and password for the virtual machine."

$vmParams = @{
  ResourceGroupName = 'TutorialResources'
  Name = 'TutorialVM1'
  Location = 'westeurope'
  ImageName = 'Win2016Datacenter'
  PublicIpAddressName = 'tutorialPublicIp'
  # VirtualNetworkName = '  '
  # SubnetName = '   '
  Credential = $cred
  OpenPorts = 3389
}
$newVM1 = New-AzVM @vmParams


