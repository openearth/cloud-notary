# tki-cloud-notary
Relevant files for the TKI cloud-notary project

Project to research a cloud environment where
* `A` can add secret data `x` 
* `B` can add secret model `f`

without it being visible to the other party, but both can see
* `y = f(x)`

Setup using Azure DevOps to transparently provision a Kubernetes
cluster in Azure, with the Deltares GTSM model as `f` and van Oord buoy data as `x`.
