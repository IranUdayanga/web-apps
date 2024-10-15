param hostingPlanName string
param appServicePlanId string
param appNames array

// Reusable web app module
module webApp 'webapp.bicep' = [for appName in appNames: {
  name: '${appName}-webapp'
  params: {
    hostingPlanId: appServicePlanId
    appName: appName
  }
}]

output webAppUrls array = [for webApp in webApp: webApp.outputs.webAppUrl]
