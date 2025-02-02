# How To Run ActionGroup.Tests.ps1

`ActionGroup.Tests.ps1` contains examples of using the `Confirm-AzBPActionGroup` cmdlet.

## Pre-Requisites

- Follow the [setup instructions](../README.md)

## Steps

1. Navigate to ActionGroup directory:

   ```Powershell
   cd examples\ActionGroup\
   ```

1. Deploy the action group to your resource group:

   ```Powershell
    New-AzResourceGroupDeployment -ResourceGroupName "<your-resource-group-name>"`
    -TemplateFile ".\actionGroup.bicep"
   ```

1. Update `ActionGroup.Tests.ps1` variables to point to your expected resources:

   - `test-rg` -> `your-resource-group-name`
   - `sampleaction` -> `your-action-group-name`

1. If using a local copy of `Az-InfrastructureTest`, replace `Import-Module Az-InfrastructureTest` with
`Import-Module "../../bin/BenchPress.Azure.psd1"`.

1. Run `ActionGroup.Tests.ps1`:

   ```Powershell
   Invoke-Pester -Path .\ActionGroup.Tests.ps1
   ```

1. Success!

   ```Powershell
   Tests completed in 952ms
   Tests Passed: 2, Failed: 0, Skipped: 0 NotRun: 0
   ```

1. Don't forget to delete any deployed resources that are no longer needed.
