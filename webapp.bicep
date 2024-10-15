param hostingPlanId string
param appName string

resource webApp 'Microsoft.Web/sites@2021-01-15' = {
  name: appName
  location: resourceGroup().location
  kind: 'app'
  properties: {
    serverFarmId: hostingPlanId
    siteConfig: {
      appSettings: [
        {
          name: 'WEBSITE_TIME_ZONE'
          value: 'AUS Eastern Standard Time' // Brisbane time zone
        }
      ]
    }
  }
}

output webAppUrl string = 'https://${webApp.name}.azurewebsites.net'
