################
####  2021  ####
################

# Create recourse group
az group create -l westeurope -n tki

# Create service princepal to deploy kubernetes cluster
az ad sp create-for-rbac --skip-assignment

# Create keyvault to store the created service princepal
az keyvault create --location westeurope --name tkikubernetes --resource-group tki

# Add kubeappid in keyvault. This is the appId from the service principal
az keyvault secret set -n kubeappid --vault-name tkikubernetes --value XXX

# Add kubeapppassword. This is the password from the service principal
az keyvault secret set -n kubeapppassword --vault-name tkikubernetes --value XXX

# Set policy get and list policy on the keyvault for the service principal used in azure devops.
# This is de Application ID from the service principal. This is made with new service connection.
az keyvault set-policy -n tkikubernetes --secret-permissions get list --spn XXX

# Resource group B data
az group create -l westeurope -n B

# Create storage acount B data
az storage account create -n Bdatav3 -g B -l westeurope --sku Standard_LRS

#List Keys
az storage account keys list -g B -n Bdatav3

# Create keyvault B storage account secrets
az keyvault create --location westeurope --name Bv2 --resource-group B

# Add key storage account B to keyvault
az keyvault secret set -n storageB --vault-name Bv2 --value XXX

# set permissions keyvault
az keyvault set-policy -n Bv2 --secret-permissions get list --spn XXX

# Create azure file share
az storage share create --name buoydata --account-key XXX --account-name Bdatav3

# Add file to azure files
az storage file upload --account-key XXX --account-name Bdatav3 --path D0.mat --share-name buoydata --source ./D0.mat
