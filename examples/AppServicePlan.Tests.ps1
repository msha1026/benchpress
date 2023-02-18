BeforeAll {
    Import-Module "../BenchPress/Helpers/BenchPress.Azure/BenchPress.Azure.psd1"
}

Describe 'Verify App Service Plan' {
    it 'Should contain an App Service Plan with the given name' {
        #arrange
        $rgName = 'rg-test'
        $appServicePlanName = 'appserviceplantest1'

        #act
        $exists = Get-AzBPAppServicePlan -ResourceGroupName $rgName -AppServicePlanName $appServicePlanName

        #assert
        $exists | Should -Not -BeNullOrEmpty
    }
}

Describe 'Verify App Service Plan Exists' {
    it 'Should contain an App Service Plan with the given name' {
        #arrange
        $rgName = 'rg-test'
        $appServicePlanName = 'appserviceplantest1'

        #act
        $exists = Get-AzBPAppServicePlanExist -ResourceGroupName $rgName -AppServicePlanName $appServicePlanName

        #assert
        $exists | Should -Be $true
    }
}

Describe 'Verify App Service Plan Does Not Exist' {
    it 'Should not contain an App Service Plan with the given name' {
        #arrange
        $rgName = 'rg-test'
        $appServicePlanName = 'appserviceplantest1'

        #act
        # The '-ErrorAction SilentlyContinue' command suppresses all errors.
        # In this test, it will suppress the error message when a resource cannot be found.
        # Remove this field to see all errors.
        $exists = Get-AzBPAppServicePlanExist -ResourceGroupName $rgName -AppServicePlanName $appServicePlanName -ErrorAction SilentlyContinue

        #assert
        $exists | Should -Be $false
    }
}

Describe 'Spin up , Tear down App Service Plan' {
    it 'Should deploy a bicep file.' {
      #arrange
      $resourceGroupName = "rg-test"
      $bicepPath = "./appserviceplan.bicep"
      $params = @{
        name           = "appserviceplantest2"
        location       = "westus3"
      }

      #act
      $deployment = Deploy-AzBPBicepFeature -BicepPath $bicepPath -Params $params -ResourceGroupName $resourceGroupName

      #assert
      $deployment.ProvisioningState | Should -Be "Succeeded"

      #clean up
      Remove-AzBPBicepFeature -ResourceGroupName $resourceGroupName
    }
}
