# INLINE_SKIP
using module ./../Classes/ConfirmResult.psm1

. $PSScriptRoot/../Private/Connect-Account.ps1
# end INLINE_SKIP

function Confirm-SqlServer {
  <#
    .SYNOPSIS
      Confirms that a SQL Server exists.

    .DESCRIPTION
      The Confirm-AzBPSqlServer cmdlet gets a SQL Server using the specified SQL Server and
      Resource Group name.

    .PARAMETER ServerName
      The name of the SQL Server

    .PARAMETER ResourceGroupName
      The name of the Resource Group

    .EXAMPLE
      Confirm-AzBPSqlServer -ServerName "testserver" -ResourceGroupName "rgbenchpresstest"

    .INPUTS
      System.String

    .OUTPUTS
      ConfirmResult
  #>
  [CmdletBinding()]
  [OutputType([ConfirmResult])]
  param (
    [Parameter(Mandatory=$true)]
    [string]$ServerName,

    [Parameter(Mandatory=$true)]
    [string]$ResourceGroupName
  )
  Begin {
    $ConnectResults = Connect-Account
  }
  Process {
      $Resource = Get-AzSqlServer -ResourceGroupName $ResourceGroupName -ServerName $ServerName

      [ConfirmResult]::new($Resource, $ConnectResults.AuthenticationData)
  }
  End { }
}
