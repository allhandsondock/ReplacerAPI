

@description('Azure Container Instance')
resource azfuncreplacerapi 'Microsoft.ContainerInstance/containerGroups@2021-10-01' = {
  properties: {
    sku: 'Standard'
    containers: [
      {
        name: 'az-func-replacerapi1'
        properties: {
          image: 'allhandsondock/azfuncapi:v1.0.0'
          ports: [
            {
              protocol: 'TCP'
              port: 80
            }
          ]
          environmentVariables: []
          resources: {
            requests: {
              memoryInGB: '1.5'
              cpu: '1.0'
            }
          }
        }
      }
    ]
    initContainers: []
    restartPolicy: 'OnFailure'
    ipAddress: {
      ports: [
        {
          protocol: 'TCP'
          port: 80
        }
      ]
      ip: azpip.properties.ipAddress
      type: 'Public'
    }
    osType: 'Linux'
  }
  name: 'az-func-replacerapi'
  location: 'westeurope'
  tags:{
    Env:'demo'
  }
  
}

resource azpip 'Microsoft.Network/publicIPAddresses@2022-05-01' = {
  name: 'az-pip'
  location: 'westeurope'
  properties: {
    publicIPAddressVersion: 'IPv4'
    publicIPAllocationMethod: 'Static'
    idleTimeoutInMinutes: 4
    ipTags: []
  }
  sku: {
    name: 'Standard'
    tier: 'Regional'
  }
  tags:{
    Env:'demo'
  }
}
