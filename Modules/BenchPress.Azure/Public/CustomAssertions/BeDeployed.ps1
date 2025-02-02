function ShouldBeDeployed ($ActualValue, [switch] $Negate, [string] $Because) {
  <#
    .SYNOPSIS
      Custom Assertion function to check status on a resource deployment.

    .DESCRIPTION
      BeDeployed is a custom assertion that checks the provided ConfirmResult Object for deployment success.
      It can be used when writing Pester tests.

    .EXAMPLE
      $result = Confirm-AzBPResourceGroup -ResourceGroupName $rgName

      $result | Should -BeDeployed

    .EXAMPLE
      $result = Confirm-AzBPResourceGroup -ResourceGroupName $rgName

      $result | Should -Not -BeDeployed

    .INPUTS
      ConfirmResult
      System.Switch
      System.String

    .OUTPUTS
      PSCustomObject
  #>
  if ($null -eq $ActualValue){
    [bool] $succeeded = $false

    if ($Negate) { $succeeded = -not $succeeded }
    $failureMessage = "ConfirmResult is null or empty."
  }
  else {
    [bool] $succeeded = $ActualValue.Success
    if ($Negate) { $succeeded = -not $succeeded }

    if (-not $succeeded) {
      if ($Negate) {
        $failureMessage = "Resource is currently deployed, but should not be."
      }
      else {
        $failureMessage = "Resource not deployed or there was an error when confirming resource."
        if ($Because) { $failureMessage = "Resource not available $Because." }
      }
    }
  }
  return [pscustomobject]@{
    Succeeded      = $succeeded
    FailureMessage = $failureMessage
  }
}

Add-ShouldOperator -Name BeDeployed `
    -InternalName 'ShouldBeDeployed' `
    -Test ${function:ShouldBeDeployed} `
    -Alias 'SBD'
