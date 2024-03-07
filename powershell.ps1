# Define parameters
$resourceGroupName = "example-resources"
$location = "West Europe"
$storageAccountName = "examplestoracc"

# Create a resource group
New-AzResourceGroup -Name $resourceGroupName -Location $location

# Create a storage account
New-AzStorageAccount -ResourceGroupName $resourceGroupName `
    -Name $storageAccountName `
    -Location $location `
    -SkuName "Standard_LRS" `
    -Kind "StorageV2" `
    -EnableHttpsTrafficOnly $true

# Set the storage account tags
Set-AzResource -ResourceGroupName $resourceGroupName `
    -Name $storageAccountName `
    -ResourceType "Microsoft.Storage/storageAccounts" `
    -Tag @{ environment = "staging" }