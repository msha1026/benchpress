# How To Run SqlDatabase.Tests.ps1

`SqlDatabase.Tests.ps1` contains examples of using the `Confirm-AzBPSqlDatabase` cmdlet.

## Pre-Requisites

- Follow the [setup instructions](../README.md)

## Steps

1. Navigate to SqlDatabase directory:

   ```Powershell
   cd examples\SqlDatabase\
   ```

1. Deploy the SQL Database to your resource group:

   ```Powershell
    New-AzResourceGroupDeployment -ResourceGroupName "<your-resource-group-name>"`
    -TemplateFile ".\sqlDatabase.bicep"
   ```

1. When prompted in your terminal, set the `adminPassword` parameter with your own password.

1. Update `SqlDatabase.Tests.ps1` variables to point to your expected resources:

   - `rg-test` -> `your-resource-group-name`
   - `samplesqlserver` -> `your-sql-server-name`
   - `samplesqldatabase` -> `your-sql-db-name`

1. If using a local copy of `Az-InfrastructureTest`, replace `Import-Module Az-InfrastructureTest` with
`Import-Module "../../bin/BenchPress.Azure.psd1"`.

1. Run `SqlDatabase.Tests.ps1`:

   ```Powershell
   Invoke-Pester -Path .\SqlDatabase.Tests.ps1
   ```

1. Success!

   ```Powershell
   Tests completed in 952ms
   Tests Passed: 2, Failed: 0, Skipped: 0 NotRun: 0
   ```

1. Don't forget to delete any deployed resources that are no longer needed.
