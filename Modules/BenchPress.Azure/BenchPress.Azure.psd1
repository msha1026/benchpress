# Module manifest for module "BenchPress.Azure"
# Generated by: CSEDevOps
# Generated on: 12/1/2022
@{
  RootModule = "BenchPress.Azure.psm1"
  ModuleVersion = "0.2.18"
  GUID = "3db0c6b2-7453-4972-a9de-402be1277ac9"
  Author = "CSEDevOps"
  CompanyName = "Microsoft"
  Copyright = "(c) Microsoft. All rights reserved."
  Description = "Benchpress Test Framework for Azure Deployment Scenarios"
  NestedModules = @()
  FunctionsToExport = @(
    "Confirm-ActionGroup",
    "Confirm-AksCluster",
    "Confirm-AppInsights",
    "Confirm-AppServicePlan",
    "Confirm-BicepFile",
    "Confirm-ContainerRegistry",
    "Confirm-KeyVault",
    "Confirm-KeyVaultCertificate",
    "Confirm-KeyVaultKey",
    "Confirm-KeyVaultSecret",
    "Confirm-OperationalInsightsWorkspace",
    "Confirm-Resource",
    "Confirm-ResourceGroup",
    "Confirm-SqlDatabase",
    "Confirm-SqlServer",
    "Confirm-StorageAccount",
    "Confirm-SynapseSparkPool",
    "Confirm-SynapseSqlPool",
    "Confirm-SynapseWorkspace",
    "Confirm-VirtualMachine",
    "Confirm-WebApp",
    "Deploy-BicepFeature",
    "Get-Resource",
    "Get-ResourceByType",
    "Invoke-AzCli",
    "Remove-BicepFeature",
    "ShouldBeDeployed",
    "ShouldBeInLocation",
    "ShouldBeInResourceGroup"
  )
  PrivateData = @{
    PSData = @{
      Tags = @("Azure", "BenchPress", "Bicep", "ARM", "Test", "ActionGroup", "AKS", "AksCluster", "ContainerRegistry", "KeyVault", "ResourceGroup", "ServicePlan", "SqlDatabase", "SqlServer", "StorageAccount", "VirtualMachine", "WebApp")
      LicenseUri = ""
      ProjectUri = "https://github.com/Azure/benchpress/"
      IconUri = ""
      ReleaseNotes = ""
      Prerelease = ""
      RequireLicenseAcceptance = $false
    }
  }
  HelpInfoURI = "https://github.com/Azure/benchpress/"
  DefaultCommandPrefix = "AzBP"
}
