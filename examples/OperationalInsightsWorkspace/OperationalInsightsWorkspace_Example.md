# How To Run OperationalInsightsWorkspace.Tests.ps1

`OperationalInsightsWorkspace.Tests.ps1` contains examples of using the `Confirm-AzBPOperationalInsightsWorkspace`
cmdlet.

## Pre-Requisites

- Follow the [setup instructions](../README.md)

## Steps

1. Navigate to OperationalInsightsWorkspace directory:

   ```Powershell
   cd examples/OperationalInsightsWorkspace/
   ```

1. Deploy the Operational Insights Workspace to your subscription:

   ```Powershell
    New-AzSubscriptionDeployment -TemplateFile "./operationalInsightsWorkspace.bicep" `
    -Location "WestUS3"
   ```

1. Update `OperationalInsightsWorkspace.Tests.ps1` variables to point to your expected resources:

   - `rg-test` -> `your-resource-group-name`
   - `oiwName` -> `your-operational-insights-workspace-name`
   - `notOiwName` -> `not-your-operational-insights-workspace-name`

1. If using a local copy of `Az-InfrastructureTest`, replace `Import-Module Az-InfrastructureTest` with
`Import-Module "../../bin/BenchPress.Azure.psd1"`.

1. Run `OperationalInsightsWorkspace.Tests.ps1`:

   ```Powershell
   Invoke-Pester -Path ./OperationalInsightsWorkspace.Tests.ps1
   ```

1. Success!

   ```Powershell
   Tests completed in 952ms
   Tests Passed: 2, Failed: 0, Skipped: 0 NotRun: 0
   ```

1. Don't forget to delete any deployed resources that are no longer needed.
