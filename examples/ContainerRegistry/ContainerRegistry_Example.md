# How To Run ContainerRegistry.Tests.ps1

`ContainerRegistry.Tests.ps1` contains examples of using the `Confirm-AzBPContainerRegistry` cmdlet.

## Pre-Requisites

- Follow the [setup instructions](../README.md)

## Steps

1. Navigate to ContainerRegistry directory:

   ```Powershell
   cd examples\ContainerRegistry\
   ```

1. Deploy the Container Registry to your resource group:

   ```Powershell
    New-AzResourceGroupDeployment -ResourceGroupName "<your-resource-group-name>"`
    -TemplateFile ".\containerRegistry.bicep"
   ```

1. Update `ContainerRegistry.Tests.ps1` variables to point to your expected resources:

   - `rg-test` -> `your-resource-group-name`
   - `acrbenchpresstest` -> `your-container-registry-name`

1. If using a local copy of `Az-InfrastructureTest`, replace `Import-Module Az-InfrastructureTest` with
`Import-Module "../../bin/BenchPress.Azure.psd1"`.

1. Run `ContainerRegistry.Tests.ps1`:

   ```Powershell
   Invoke-Pester -Path .\ContainerRegistry.Tests.ps1
   ```

1. Success!

   ```Powershell
   Tests completed in 952ms
   Tests Passed: 2, Failed: 0, Skipped: 0 NotRun: 0
   ```

1. Don't forget to delete any deployed resources that are no longer needed.
