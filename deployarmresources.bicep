resource batch1sender 'Microsoft.Batch/batchAccounts@2024-02-01' = {
  name: 'batch1sender'
  location: 'swedencentral'
  identity: {
    type: 'None'
  }
  properties: {
    poolAllocationMode: 'BatchService'
    publicNetworkAccess: 'Enabled'
    networkProfile: {
      accountAccess: {
        defaultAction: 'Allow'
      }
    }
    encryption: {
      keySource: 'Microsoft.Batch'
    }
    allowedAuthenticationModes: [
      'SharedKey'
      'AAD'
      'TaskAuthenticationToken'
    ]
  }
}

resource batchfrance 'Microsoft.Batch/batchAccounts@2024-02-01' = {
  name: 'batchfrance'
  location: 'francecentral'
  identity: {
    type: 'None'
  }
  properties: {
    poolAllocationMode: 'BatchService'
    publicNetworkAccess: 'Enabled'
    networkProfile: {
      accountAccess: {
        defaultAction: 'Allow'
      }
    }
    encryption: {
      keySource: 'Microsoft.Batch'
    }
    allowedAuthenticationModes: [
      'SharedKey'
      'AAD'
      'TaskAuthenticationToken'
    ]
  }
}

resource batchgwc 'Microsoft.Batch/batchAccounts@2024-02-01' = {
  name: 'batchgwc'
  location: 'germanywestcentral'
  identity: {
    type: 'None'
  }
  properties: {
    poolAllocationMode: 'BatchService'
    publicNetworkAccess: 'Enabled'
    networkProfile: {
      accountAccess: {
        defaultAction: 'Allow'
      }
    }
    encryption: {
      keySource: 'Microsoft.Batch'
    }
    allowedAuthenticationModes: [
      'SharedKey'
      'AAD'
      'TaskAuthenticationToken'
    ]
  }
}

resource ag_ddos_alert_1 'microsoft.insights/actionGroups@2023-01-01' = {
  name: 'ag-ddos-alert-1'
  location: 'Global'
  properties: {
    groupShortName: 'Ddos Alert'
    enabled: true
    emailReceivers: [
      {
        name: 'Mail_-EmailAction-'
        emailAddress: 'henrik.motzkus@microsoft.com'
        useCommonAlertSchema: false
      }
    ]
    smsReceivers: []
    webhookReceivers: []
    eventHubReceivers: []
    itsmReceivers: []
    azureAppPushReceivers: []
    automationRunbookReceivers: []
    voiceReceivers: []
    logicAppReceivers: []
    azureFunctionReceivers: []
    armRoleReceivers: []
  }
}

resource ddos_plan_1 'Microsoft.Network/ddosProtectionPlans@2023-11-01' = {
  name: 'ddos-plan-1'
  location: 'swedencentral'
  properties: {}
}

resource ddos_outbound_1_default_nsg_swedencentral 'Microsoft.Network/networkSecurityGroups@2023-11-01' = {
  name: 'ddos-outbound-1-default-nsg-swedencentral'
  location: 'swedencentral'
  properties: {
    securityRules: [
      {
        name: 'AllowCorpnet'
        id: ddos_outbound_1_default_nsg_swedencentral_AllowCorpnet.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          description: 'CSS Governance Security Rule.  Allow Corpnet inbound.  https://aka.ms/casg'
          protocol: '*'
          sourcePortRange: '*'
          destinationPortRange: '*'
          sourceAddressPrefix: 'CorpNetPublic'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 2700
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'AllowSAW'
        id: ddos_outbound_1_default_nsg_swedencentral_AllowSAW.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          description: 'CSS Governance Security Rule.  Allow SAW inbound.  https://aka.ms/casg'
          protocol: '*'
          sourcePortRange: '*'
          destinationPortRange: '*'
          sourceAddressPrefix: 'CorpNetSaw'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 2701
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'AllowTagCustomAnyInbound'
        id: ddos_outbound_1_default_nsg_swedencentral_AllowTagCustomAnyInbound.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: '*'
          sourcePortRange: '*'
          destinationPortRange: '*'
          sourceAddressPrefix: 'BatchNodeManagement.SwedenCentral'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 2711
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'AllowMyIpAddressCustom50001Inbound'
        id: ddos_outbound_1_default_nsg_swedencentral_AllowMyIpAddressCustom50001Inbound.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: '*'
          sourcePortRange: '*'
          destinationPortRange: '50001'
          sourceAddressPrefix: '84.46.89.134'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 2721
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
    ]
  }
}

resource target_1_nsg 'Microsoft.Network/networkSecurityGroups@2023-11-01' = {
  name: 'target-1-nsg'
  location: 'swedencentral'
  properties: {
    securityRules: [
      {
        name: 'http'
        id: target_1_nsg_http.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: 'TCP'
          sourcePortRange: '*'
          destinationPortRange: '80'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 1020
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'https'
        id: target_1_nsg_https.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: 'TCP'
          sourcePortRange: '*'
          destinationPortRange: '443'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 1030
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'mysql'
        id: target_1_nsg_mysql.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: 'TCP'
          sourcePortRange: '*'
          destinationPortRange: '3306'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 1040
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
    ]
  }
}

resource target_1_vnet_default_nsg_swedencentral 'Microsoft.Network/networkSecurityGroups@2023-11-01' = {
  name: 'target-1-vnet-default-nsg-swedencentral'
  location: 'swedencentral'
  properties: {
    securityRules: [
      {
        name: 'AllowCorpnet'
        id: target_1_vnet_default_nsg_swedencentral_AllowCorpnet.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          description: 'CSS Governance Security Rule.  Allow Corpnet inbound.  https://aka.ms/casg'
          protocol: '*'
          sourcePortRange: '*'
          destinationPortRange: '*'
          sourceAddressPrefix: 'CorpNetPublic'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 2700
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'AllowSAW'
        id: target_1_vnet_default_nsg_swedencentral_AllowSAW.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          description: 'CSS Governance Security Rule.  Allow SAW inbound.  https://aka.ms/casg'
          protocol: '*'
          sourcePortRange: '*'
          destinationPortRange: '*'
          sourceAddressPrefix: 'CorpNetSaw'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 2701
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'AllowMyIpAddressHTTPSInbound'
        id: target_1_vnet_default_nsg_swedencentral_AllowMyIpAddressHTTPSInbound.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: 'TCP'
          sourcePortRange: '*'
          destinationPortRange: '443'
          sourceAddressPrefix: '84.46.89.134'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 2721
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'AllowMyIpAddressHTTPInbound'
        id: target_1_vnet_default_nsg_swedencentral_AllowMyIpAddressHTTPInbound.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: 'TCP'
          sourcePortRange: '*'
          destinationPortRange: '80'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 2731
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
    ]
  }
}

resource target_1_ip 'Microsoft.Network/publicIPAddresses@2023-11-01' = {
  name: 'target-1-ip'
  location: 'swedencentral'
  sku: {
    name: 'Standard'
    tier: 'Regional'
  }
  zones: [
    '1'
  ]
  properties: {
    ipAddress: '20.240.223.158'
    publicIPAddressVersion: 'IPv4'
    publicIPAllocationMethod: 'Static'
    idleTimeoutInMinutes: 4
    ipTags: []
  }
}

resource ddos_target_1 'Microsoft.OperationalInsights/workspaces@2023-09-01' = {
  name: 'ddos-target-1'
  location: 'swedencentral'
  properties: {
    sku: {
      name: 'pergb2018'
    }
    retentionInDays: 30
    features: {
      legacy: 0
      searchVersion: 1
      enableLogAccessUsingOnlyResourcePermissions: true
    }
    workspaceCapping: {
      dailyQuotaGb: -1
    }
    publicNetworkAccessForIngestion: 'Enabled'
    publicNetworkAccessForQuery: 'Enabled'
  }
}

resource target_1 'Microsoft.Compute/virtualMachines@2024-03-01' = {
  name: 'target-1'
  location: 'swedencentral'
  zones: [
    '1'
  ]
  plan: {
    name: 'wordpress'
    product: 'wordpress'
    publisher: 'athinfosystems1641442221349'
  }
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_D2as_v5'
    }
    additionalCapabilities: {
      hibernationEnabled: false
    }
    storageProfile: {
      imageReference: {
        publisher: 'athinfosystems1641442221349'
        offer: 'wordpress'
        sku: 'wordpress'
        version: 'latest'
      }
      osDisk: {
        osType: 'Linux'
        name: 'target-1_OsDisk_1_04852c1b08ec4ac59e2bcfa7f3e80ccf'
        createOption: 'FromImage'
        caching: 'ReadWrite'
        managedDisk: {
          id: resourceId('Microsoft.Compute/disks', 'target-1_OsDisk_1_04852c1b08ec4ac59e2bcfa7f3e80ccf')
        }
        deleteOption: 'Delete'
      }
      dataDisks: []
    }
    osProfile: {
      computerName: 'target-1'
      adminUsername: 'adminlocal'
      linuxConfiguration: {
        disablePasswordAuthentication: false
        provisionVMAgent: true
        patchSettings: {
          patchMode: 'ImageDefault'
          assessmentMode: 'ImageDefault'
        }
      }
      secrets: []
      allowExtensionOperations: true
      requireGuestProvisionSignal: true
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: target_1112_z1.id
          properties: {
            deleteOption: 'Detach'
          }
        }
      ]
    }
    diagnosticsProfile: {
      bootDiagnostics: {
        enabled: true
      }
    }
  }
}

resource ddos_outbound_1_default_nsg_swedencentral_AllowCorpnet 'Microsoft.Network/networkSecurityGroups/securityRules@2023-11-01' = {
  name: 'ddos-outbound-1-default-nsg-swedencentral/AllowCorpnet'
  properties: {
    description: 'CSS Governance Security Rule.  Allow Corpnet inbound.  https://aka.ms/casg'
    protocol: '*'
    sourcePortRange: '*'
    destinationPortRange: '*'
    sourceAddressPrefix: 'CorpNetPublic'
    destinationAddressPrefix: '*'
    access: 'Allow'
    priority: 2700
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
  dependsOn: [
    ddos_outbound_1_default_nsg_swedencentral
  ]
}

resource ddos_outbound_1_default_nsg_swedencentral_AllowMyIpAddressCustom50001Inbound 'Microsoft.Network/networkSecurityGroups/securityRules@2023-11-01' = {
  name: 'ddos-outbound-1-default-nsg-swedencentral/AllowMyIpAddressCustom50001Inbound'
  properties: {
    protocol: '*'
    sourcePortRange: '*'
    destinationPortRange: '50001'
    sourceAddressPrefix: '84.46.89.134'
    destinationAddressPrefix: '*'
    access: 'Allow'
    priority: 2721
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
  dependsOn: [
    ddos_outbound_1_default_nsg_swedencentral
  ]
}

resource ddos_outbound_1_default_nsg_swedencentral_AllowSAW 'Microsoft.Network/networkSecurityGroups/securityRules@2023-11-01' = {
  name: 'ddos-outbound-1-default-nsg-swedencentral/AllowSAW'
  properties: {
    description: 'CSS Governance Security Rule.  Allow SAW inbound.  https://aka.ms/casg'
    protocol: '*'
    sourcePortRange: '*'
    destinationPortRange: '*'
    sourceAddressPrefix: 'CorpNetSaw'
    destinationAddressPrefix: '*'
    access: 'Allow'
    priority: 2701
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
  dependsOn: [
    ddos_outbound_1_default_nsg_swedencentral
  ]
}

resource ddos_outbound_1_default_nsg_swedencentral_AllowTagCustomAnyInbound 'Microsoft.Network/networkSecurityGroups/securityRules@2023-11-01' = {
  name: 'ddos-outbound-1-default-nsg-swedencentral/AllowTagCustomAnyInbound'
  properties: {
    protocol: '*'
    sourcePortRange: '*'
    destinationPortRange: '*'
    sourceAddressPrefix: 'BatchNodeManagement.SwedenCentral'
    destinationAddressPrefix: '*'
    access: 'Allow'
    priority: 2711
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
  dependsOn: [
    ddos_outbound_1_default_nsg_swedencentral
  ]
}

resource target_1_nsg_http 'Microsoft.Network/networkSecurityGroups/securityRules@2023-11-01' = {
  name: 'target-1-nsg/http'
  properties: {
    protocol: 'TCP'
    sourcePortRange: '*'
    destinationPortRange: '80'
    sourceAddressPrefix: '*'
    destinationAddressPrefix: '*'
    access: 'Allow'
    priority: 1020
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
  dependsOn: [
    target_1_nsg
  ]
}

resource target_1_nsg_https 'Microsoft.Network/networkSecurityGroups/securityRules@2023-11-01' = {
  name: 'target-1-nsg/https'
  properties: {
    protocol: 'TCP'
    sourcePortRange: '*'
    destinationPortRange: '443'
    sourceAddressPrefix: '*'
    destinationAddressPrefix: '*'
    access: 'Allow'
    priority: 1030
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
  dependsOn: [
    target_1_nsg
  ]
}

resource target_1_nsg_mysql 'Microsoft.Network/networkSecurityGroups/securityRules@2023-11-01' = {
  name: 'target-1-nsg/mysql'
  properties: {
    protocol: 'TCP'
    sourcePortRange: '*'
    destinationPortRange: '3306'
    sourceAddressPrefix: '*'
    destinationAddressPrefix: '*'
    access: 'Allow'
    priority: 1040
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
  dependsOn: [
    target_1_nsg
  ]
}

resource target_1_vnet_default_nsg_swedencentral_AllowCorpnet 'Microsoft.Network/networkSecurityGroups/securityRules@2023-11-01' = {
  name: 'target-1-vnet-default-nsg-swedencentral/AllowCorpnet'
  properties: {
    description: 'CSS Governance Security Rule.  Allow Corpnet inbound.  https://aka.ms/casg'
    protocol: '*'
    sourcePortRange: '*'
    destinationPortRange: '*'
    sourceAddressPrefix: 'CorpNetPublic'
    destinationAddressPrefix: '*'
    access: 'Allow'
    priority: 2700
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
  dependsOn: [
    target_1_vnet_default_nsg_swedencentral
  ]
}

resource target_1_vnet_default_nsg_swedencentral_AllowMyIpAddressHTTPInbound 'Microsoft.Network/networkSecurityGroups/securityRules@2023-11-01' = {
  name: 'target-1-vnet-default-nsg-swedencentral/AllowMyIpAddressHTTPInbound'
  properties: {
    protocol: 'TCP'
    sourcePortRange: '*'
    destinationPortRange: '80'
    sourceAddressPrefix: '*'
    destinationAddressPrefix: '*'
    access: 'Allow'
    priority: 2731
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
  dependsOn: [
    target_1_vnet_default_nsg_swedencentral
  ]
}

resource target_1_vnet_default_nsg_swedencentral_AllowMyIpAddressHTTPSInbound 'Microsoft.Network/networkSecurityGroups/securityRules@2023-11-01' = {
  name: 'target-1-vnet-default-nsg-swedencentral/AllowMyIpAddressHTTPSInbound'
  properties: {
    protocol: 'TCP'
    sourcePortRange: '*'
    destinationPortRange: '443'
    sourceAddressPrefix: '84.46.89.134'
    destinationAddressPrefix: '*'
    access: 'Allow'
    priority: 2721
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
  dependsOn: [
    target_1_vnet_default_nsg_swedencentral
  ]
}

resource target_1_vnet_default_nsg_swedencentral_AllowSAW 'Microsoft.Network/networkSecurityGroups/securityRules@2023-11-01' = {
  name: 'target-1-vnet-default-nsg-swedencentral/AllowSAW'
  properties: {
    description: 'CSS Governance Security Rule.  Allow SAW inbound.  https://aka.ms/casg'
    protocol: '*'
    sourcePortRange: '*'
    destinationPortRange: '*'
    sourceAddressPrefix: 'CorpNetSaw'
    destinationAddressPrefix: '*'
    access: 'Allow'
    priority: 2701
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
  dependsOn: [
    target_1_vnet_default_nsg_swedencentral
  ]
}

resource ddos_outbound_1 'Microsoft.Network/virtualNetworks@2023-11-01' = {
  name: 'ddos-outbound-1'
  location: 'swedencentral'
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.1.0.0/16'
      ]
    }
    dhcpOptions: {
      dnsServers: []
    }
    subnets: [
      {
        name: 'default'
        id: ddos_outbound_1_default.id
        properties: {
          addressPrefix: '10.1.0.0/21'
          networkSecurityGroup: {
            id: ddos_outbound_1_default_nsg_swedencentral.id
          }
          delegations: []
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
    ]
    virtualNetworkPeerings: []
    enableDdosProtection: false
  }
}

resource ddos_target_1_LogManagement_ddos_target_1_General_AlphabeticallySortedComputers 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: ddos_target_1
  name: 'LogManagement(ddos-target-1)_General|AlphabeticallySortedComputers'
  properties: {
    category: 'General Exploration'
    displayName: 'All Computers with their most recent data'
    version: 2
    query: 'search not(ObjectName == "Advisor Metrics" or ObjectName == "ManagedSpace") | summarize AggregatedValue = max(TimeGenerated) by Computer | limit 500000 | sort by Computer asc\r\n// Oql: NOT(ObjectName="Advisor Metrics" OR ObjectName=ManagedSpace) | measure max(TimeGenerated) by Computer | top 500000 | Sort Computer // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource ddos_target_1_LogManagement_ddos_target_1_General_dataPointsPerManagementGroup 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: ddos_target_1
  name: 'LogManagement(ddos-target-1)_General|dataPointsPerManagementGroup'
  properties: {
    category: 'General Exploration'
    displayName: 'Which Management Group is generating the most data points?'
    version: 2
    query: 'search * | summarize AggregatedValue = count() by ManagementGroupName\r\n// Oql: * | Measure count() by ManagementGroupName // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource ddos_target_1_LogManagement_ddos_target_1_General_dataTypeDistribution 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: ddos_target_1
  name: 'LogManagement(ddos-target-1)_General|dataTypeDistribution'
  properties: {
    category: 'General Exploration'
    displayName: 'Distribution of data Types'
    version: 2
    query: 'search * | extend Type = $table | summarize AggregatedValue = count() by Type\r\n// Oql: * | Measure count() by Type // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource ddos_target_1_LogManagement_ddos_target_1_General_StaleComputers 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: ddos_target_1
  name: 'LogManagement(ddos-target-1)_General|StaleComputers'
  properties: {
    category: 'General Exploration'
    displayName: 'Stale Computers (data older than 24 hours)'
    version: 2
    query: 'search not(ObjectName == "Advisor Metrics" or ObjectName == "ManagedSpace") | summarize lastdata = max(TimeGenerated) by Computer | limit 500000 | where lastdata < ago(24h)\r\n// Oql: NOT(ObjectName="Advisor Metrics" OR ObjectName=ManagedSpace) | measure max(TimeGenerated) as lastdata by Computer | top 500000 | where lastdata < NOW-24HOURS // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource ddos_target_1_LogManagement_ddos_target_1_LogManagement_AllEvents 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: ddos_target_1
  name: 'LogManagement(ddos-target-1)_LogManagement|AllEvents'
  properties: {
    category: 'Log Management'
    displayName: 'All Events'
    version: 2
    query: 'Event | sort by TimeGenerated desc\r\n// Oql: Type=Event // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource ddos_target_1_LogManagement_ddos_target_1_LogManagement_AllSyslog 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: ddos_target_1
  name: 'LogManagement(ddos-target-1)_LogManagement|AllSyslog'
  properties: {
    category: 'Log Management'
    displayName: 'All Syslogs'
    version: 2
    query: 'Syslog | sort by TimeGenerated desc\r\n// Oql: Type=Syslog // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource ddos_target_1_LogManagement_ddos_target_1_LogManagement_AllSyslogByFacility 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: ddos_target_1
  name: 'LogManagement(ddos-target-1)_LogManagement|AllSyslogByFacility'
  properties: {
    category: 'Log Management'
    displayName: 'All Syslog Records grouped by Facility'
    version: 2
    query: 'Syslog | summarize AggregatedValue = count() by Facility\r\n// Oql: Type=Syslog | Measure count() by Facility // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource ddos_target_1_LogManagement_ddos_target_1_LogManagement_AllSyslogByProcess 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: ddos_target_1
  name: 'LogManagement(ddos-target-1)_LogManagement|AllSyslogByProcessName'
  properties: {
    category: 'Log Management'
    displayName: 'All Syslog Records grouped by ProcessName'
    version: 2
    query: 'Syslog | summarize AggregatedValue = count() by ProcessName\r\n// Oql: Type=Syslog | Measure count() by ProcessName // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource ddos_target_1_LogManagement_ddos_target_1_LogManagement_AllSyslogsWithErrors 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: ddos_target_1
  name: 'LogManagement(ddos-target-1)_LogManagement|AllSyslogsWithErrors'
  properties: {
    category: 'Log Management'
    displayName: 'All Syslog Records with Errors'
    version: 2
    query: 'Syslog | where SeverityLevel == "error" | sort by TimeGenerated desc\r\n// Oql: Type=Syslog SeverityLevel=error // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource ddos_target_1_LogManagement_ddos_target_1_LogManagement_AverageHTTPRequestTimeByClientIPAddress 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: ddos_target_1
  name: 'LogManagement(ddos-target-1)_LogManagement|AverageHTTPRequestTimeByClientIPAddress'
  properties: {
    category: 'Log Management'
    displayName: 'Average HTTP Request time by Client IP Address'
    version: 2
    query: 'search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = avg(TimeTaken) by cIP\r\n// Oql: Type=W3CIISLog | Measure Avg(TimeTaken) by cIP // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource ddos_target_1_LogManagement_ddos_target_1_LogManagement_AverageHTTPRequestTimeHTTPMethod 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: ddos_target_1
  name: 'LogManagement(ddos-target-1)_LogManagement|AverageHTTPRequestTimeHTTPMethod'
  properties: {
    category: 'Log Management'
    displayName: 'Average HTTP Request time by HTTP Method'
    version: 2
    query: 'search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = avg(TimeTaken) by csMethod\r\n// Oql: Type=W3CIISLog | Measure Avg(TimeTaken) by csMethod // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource ddos_target_1_LogManagement_ddos_target_1_LogManagement_CountIISLogEntriesClientIPAddress 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: ddos_target_1
  name: 'LogManagement(ddos-target-1)_LogManagement|CountIISLogEntriesClientIPAddress'
  properties: {
    category: 'Log Management'
    displayName: 'Count of IIS Log Entries by Client IP Address'
    version: 2
    query: 'search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by cIP\r\n// Oql: Type=W3CIISLog | Measure count() by cIP // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource ddos_target_1_LogManagement_ddos_target_1_LogManagement_CountIISLogEntriesHTTPRequestMethod 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: ddos_target_1
  name: 'LogManagement(ddos-target-1)_LogManagement|CountIISLogEntriesHTTPRequestMethod'
  properties: {
    category: 'Log Management'
    displayName: 'Count of IIS Log Entries by HTTP Request Method'
    version: 2
    query: 'search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by csMethod\r\n// Oql: Type=W3CIISLog | Measure count() by csMethod // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource ddos_target_1_LogManagement_ddos_target_1_LogManagement_CountIISLogEntriesHTTPUserAgent 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: ddos_target_1
  name: 'LogManagement(ddos-target-1)_LogManagement|CountIISLogEntriesHTTPUserAgent'
  properties: {
    category: 'Log Management'
    displayName: 'Count of IIS Log Entries by HTTP User Agent'
    version: 2
    query: 'search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by csUserAgent\r\n// Oql: Type=W3CIISLog | Measure count() by csUserAgent // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource ddos_target_1_LogManagement_ddos_target_1_LogManagement_CountOfIISLogEntriesByHostRequestedByClient 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: ddos_target_1
  name: 'LogManagement(ddos-target-1)_LogManagement|CountOfIISLogEntriesByHostRequestedByClient'
  properties: {
    category: 'Log Management'
    displayName: 'Count of IIS Log Entries by Host requested by client'
    version: 2
    query: 'search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by csHost\r\n// Oql: Type=W3CIISLog | Measure count() by csHost // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource ddos_target_1_LogManagement_ddos_target_1_LogManagement_CountOfIISLogEntriesByURLForHost 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: ddos_target_1
  name: 'LogManagement(ddos-target-1)_LogManagement|CountOfIISLogEntriesByURLForHost'
  properties: {
    category: 'Log Management'
    displayName: 'Count of IIS Log Entries by URL for the host "www.contoso.com" (replace with your own)'
    version: 2
    query: 'search csHost == "www.contoso.com" | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by csUriStem\r\n// Oql: Type=W3CIISLog csHost="www.contoso.com" | Measure count() by csUriStem // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource ddos_target_1_LogManagement_ddos_target_1_LogManagement_CountOfIISLogEntriesByURLRequestedByClient 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: ddos_target_1
  name: 'LogManagement(ddos-target-1)_LogManagement|CountOfIISLogEntriesByURLRequestedByClient'
  properties: {
    category: 'Log Management'
    displayName: 'Count of IIS Log Entries by URL requested by client (without query strings)'
    version: 2
    query: 'search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by csUriStem\r\n// Oql: Type=W3CIISLog | Measure count() by csUriStem // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource ddos_target_1_LogManagement_ddos_target_1_LogManagement_CountOfWarningEvents 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: ddos_target_1
  name: 'LogManagement(ddos-target-1)_LogManagement|CountOfWarningEvents'
  properties: {
    category: 'Log Management'
    displayName: 'Count of Events with level "Warning" grouped by Event ID'
    version: 2
    query: 'Event | where EventLevelName == "warning" | summarize AggregatedValue = count() by EventID\r\n// Oql: Type=Event EventLevelName=warning | Measure count() by EventID // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource ddos_target_1_LogManagement_ddos_target_1_LogManagement_DisplayBreakdownRespondCodes 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: ddos_target_1
  name: 'LogManagement(ddos-target-1)_LogManagement|DisplayBreakdownRespondCodes'
  properties: {
    category: 'Log Management'
    displayName: 'Shows breakdown of response codes'
    version: 2
    query: 'search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by scStatus\r\n// Oql: Type=W3CIISLog | Measure count() by scStatus // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource ddos_target_1_LogManagement_ddos_target_1_LogManagement_EventsByEventLog 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: ddos_target_1
  name: 'LogManagement(ddos-target-1)_LogManagement|EventsByEventLog'
  properties: {
    category: 'Log Management'
    displayName: 'Count of Events grouped by Event Log'
    version: 2
    query: 'Event | summarize AggregatedValue = count() by EventLog\r\n// Oql: Type=Event | Measure count() by EventLog // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource ddos_target_1_LogManagement_ddos_target_1_LogManagement_EventsByEventsID 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: ddos_target_1
  name: 'LogManagement(ddos-target-1)_LogManagement|EventsByEventsID'
  properties: {
    category: 'Log Management'
    displayName: 'Count of Events grouped by Event ID'
    version: 2
    query: 'Event | summarize AggregatedValue = count() by EventID\r\n// Oql: Type=Event | Measure count() by EventID // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource ddos_target_1_LogManagement_ddos_target_1_LogManagement_EventsByEventSource 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: ddos_target_1
  name: 'LogManagement(ddos-target-1)_LogManagement|EventsByEventSource'
  properties: {
    category: 'Log Management'
    displayName: 'Count of Events grouped by Event Source'
    version: 2
    query: 'Event | summarize AggregatedValue = count() by Source\r\n// Oql: Type=Event | Measure count() by Source // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource ddos_target_1_LogManagement_ddos_target_1_LogManagement_EventsInOMBetween2000to3000 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: ddos_target_1
  name: 'LogManagement(ddos-target-1)_LogManagement|EventsInOMBetween2000to3000'
  properties: {
    category: 'Log Management'
    displayName: 'Events in the Operations Manager Event Log whose Event ID is in the range between 2000 and 3000'
    version: 2
    query: 'Event | where EventLog == "Operations Manager" and EventID >= 2000 and EventID <= 3000 | sort by TimeGenerated desc\r\n// Oql: Type=Event EventLog="Operations Manager" EventID:[2000..3000] // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource ddos_target_1_LogManagement_ddos_target_1_LogManagement_EventsWithStartedinEventID 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: ddos_target_1
  name: 'LogManagement(ddos-target-1)_LogManagement|EventsWithStartedinEventID'
  properties: {
    category: 'Log Management'
    displayName: 'Count of Events containing the word "started" grouped by EventID'
    version: 2
    query: 'search in (Event) "started" | summarize AggregatedValue = count() by EventID\r\n// Oql: Type=Event "started" | Measure count() by EventID // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource ddos_target_1_LogManagement_ddos_target_1_LogManagement_FindMaximumTimeTakenForEachPage 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: ddos_target_1
  name: 'LogManagement(ddos-target-1)_LogManagement|FindMaximumTimeTakenForEachPage'
  properties: {
    category: 'Log Management'
    displayName: 'Find the maximum time taken for each page'
    version: 2
    query: 'search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = max(TimeTaken) by csUriStem\r\n// Oql: Type=W3CIISLog | Measure Max(TimeTaken) by csUriStem // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource ddos_target_1_LogManagement_ddos_target_1_LogManagement_IISLogEntriesForClientIP 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: ddos_target_1
  name: 'LogManagement(ddos-target-1)_LogManagement|IISLogEntriesForClientIP'
  properties: {
    category: 'Log Management'
    displayName: 'IIS Log Entries for a specific client IP Address (replace with your own)'
    version: 2
    query: 'search cIP == "192.168.0.1" | extend Type = $table | where Type == W3CIISLog | sort by TimeGenerated desc | project csUriStem, scBytes, csBytes, TimeTaken, scStatus\r\n// Oql: Type=W3CIISLog cIP="192.168.0.1" | Select csUriStem,scBytes,csBytes,TimeTaken,scStatus // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource ddos_target_1_LogManagement_ddos_target_1_LogManagement_ListAllIISLogEntries 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: ddos_target_1
  name: 'LogManagement(ddos-target-1)_LogManagement|ListAllIISLogEntries'
  properties: {
    category: 'Log Management'
    displayName: 'All IIS Log Entries'
    version: 2
    query: 'search * | extend Type = $table | where Type == W3CIISLog | sort by TimeGenerated desc\r\n// Oql: Type=W3CIISLog // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource ddos_target_1_LogManagement_ddos_target_1_LogManagement_NoOfConnectionsToOMSDKService 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: ddos_target_1
  name: 'LogManagement(ddos-target-1)_LogManagement|NoOfConnectionsToOMSDKService'
  properties: {
    category: 'Log Management'
    displayName: 'How many connections to Operations Manager\'s SDK service by day'
    version: 2
    query: 'Event | where EventID == 26328 and EventLog == "Operations Manager" | summarize AggregatedValue = count() by bin(TimeGenerated, 1d) | sort by TimeGenerated desc\r\n// Oql: Type=Event EventID=26328 EventLog="Operations Manager" | Measure count() interval 1DAY // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource ddos_target_1_LogManagement_ddos_target_1_LogManagement_ServerRestartTime 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: ddos_target_1
  name: 'LogManagement(ddos-target-1)_LogManagement|ServerRestartTime'
  properties: {
    category: 'Log Management'
    displayName: 'When did my servers initiate restart?'
    version: 2
    query: 'search in (Event) "shutdown" and EventLog == "System" and Source == "User32" and EventID == 1074 | sort by TimeGenerated desc | project TimeGenerated, Computer\r\n// Oql: shutdown Type=Event EventLog=System Source=User32 EventID=1074 | Select TimeGenerated,Computer // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource ddos_target_1_LogManagement_ddos_target_1_LogManagement_Show404PagesList 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: ddos_target_1
  name: 'LogManagement(ddos-target-1)_LogManagement|Show404PagesList'
  properties: {
    category: 'Log Management'
    displayName: 'Shows which pages people are getting a 404 for'
    version: 2
    query: 'search scStatus == 404 | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by csUriStem\r\n// Oql: Type=W3CIISLog scStatus=404 | Measure count() by csUriStem // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource ddos_target_1_LogManagement_ddos_target_1_LogManagement_ShowServersThrowingInternalServerError 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: ddos_target_1
  name: 'LogManagement(ddos-target-1)_LogManagement|ShowServersThrowingInternalServerError'
  properties: {
    category: 'Log Management'
    displayName: 'Shows servers that are throwing internal server error'
    version: 2
    query: 'search scStatus == 500 | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by sComputerName\r\n// Oql: Type=W3CIISLog scStatus=500 | Measure count() by sComputerName // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource ddos_target_1_LogManagement_ddos_target_1_LogManagement_TotalBytesReceivedByEachAzureRoleInstance 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: ddos_target_1
  name: 'LogManagement(ddos-target-1)_LogManagement|TotalBytesReceivedByEachAzureRoleInstance'
  properties: {
    category: 'Log Management'
    displayName: 'Total Bytes received by each Azure Role Instance'
    version: 2
    query: 'search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = sum(csBytes) by RoleInstance\r\n// Oql: Type=W3CIISLog | Measure Sum(csBytes) by RoleInstance // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource ddos_target_1_LogManagement_ddos_target_1_LogManagement_TotalBytesReceivedByEachIISComputer 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: ddos_target_1
  name: 'LogManagement(ddos-target-1)_LogManagement|TotalBytesReceivedByEachIISComputer'
  properties: {
    category: 'Log Management'
    displayName: 'Total Bytes received by each IIS Computer'
    version: 2
    query: 'search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = sum(csBytes) by Computer | limit 500000\r\n// Oql: Type=W3CIISLog | Measure Sum(csBytes) by Computer | top 500000 // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource ddos_target_1_LogManagement_ddos_target_1_LogManagement_TotalBytesRespondedToClientsByClientIPAddress 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: ddos_target_1
  name: 'LogManagement(ddos-target-1)_LogManagement|TotalBytesRespondedToClientsByClientIPAddress'
  properties: {
    category: 'Log Management'
    displayName: 'Total Bytes responded back to clients by Client IP Address'
    version: 2
    query: 'search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = sum(scBytes) by cIP\r\n// Oql: Type=W3CIISLog | Measure Sum(scBytes) by cIP // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource ddos_target_1_LogManagement_ddos_target_1_LogManagement_TotalBytesRespondedToClientsByEachIISServerIPAddress 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: ddos_target_1
  name: 'LogManagement(ddos-target-1)_LogManagement|TotalBytesRespondedToClientsByEachIISServerIPAddress'
  properties: {
    category: 'Log Management'
    displayName: 'Total Bytes responded back to clients by each IIS ServerIP Address'
    version: 2
    query: 'search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = sum(scBytes) by sIP\r\n// Oql: Type=W3CIISLog | Measure Sum(scBytes) by sIP // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource ddos_target_1_LogManagement_ddos_target_1_LogManagement_TotalBytesSentByClientIPAddress 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: ddos_target_1
  name: 'LogManagement(ddos-target-1)_LogManagement|TotalBytesSentByClientIPAddress'
  properties: {
    category: 'Log Management'
    displayName: 'Total Bytes sent by Client IP Address'
    version: 2
    query: 'search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = sum(csBytes) by cIP\r\n// Oql: Type=W3CIISLog | Measure Sum(csBytes) by cIP // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource ddos_target_1_LogManagement_ddos_target_1_LogManagement_WarningEvents 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: ddos_target_1
  name: 'LogManagement(ddos-target-1)_LogManagement|WarningEvents'
  properties: {
    category: 'Log Management'
    displayName: 'All Events with level "Warning"'
    version: 2
    query: 'Event | where EventLevelName == "warning" | sort by TimeGenerated desc\r\n// Oql: Type=Event EventLevelName=warning // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource ddos_target_1_LogManagement_ddos_target_1_LogManagement_WindowsFireawallPolicySettingsChanged 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: ddos_target_1
  name: 'LogManagement(ddos-target-1)_LogManagement|WindowsFireawallPolicySettingsChanged'
  properties: {
    category: 'Log Management'
    displayName: 'Windows Firewall Policy settings have changed'
    version: 2
    query: 'Event | where EventLog == "Microsoft-Windows-Windows Firewall With Advanced Security/Firewall" and EventID == 2008 | sort by TimeGenerated desc\r\n// Oql: Type=Event EventLog="Microsoft-Windows-Windows Firewall With Advanced Security/Firewall" EventID=2008 // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource ddos_target_1_LogManagement_ddos_target_1_LogManagement_WindowsFireawallPolicySettingsChangedByMachines 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: ddos_target_1
  name: 'LogManagement(ddos-target-1)_LogManagement|WindowsFireawallPolicySettingsChangedByMachines'
  properties: {
    category: 'Log Management'
    displayName: 'On which machines and how many times have Windows Firewall Policy settings changed'
    version: 2
    query: 'Event | where EventLog == "Microsoft-Windows-Windows Firewall With Advanced Security/Firewall" and EventID == 2008 | summarize AggregatedValue = count() by Computer | limit 500000\r\n// Oql: Type=Event EventLog="Microsoft-Windows-Windows Firewall With Advanced Security/Firewall" EventID=2008 | measure count() by Computer | top 500000 // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource ddos_target_1_AACAudit 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AACAudit'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AACAudit'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AACHttpRequest 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AACHttpRequest'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AACHttpRequest'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AADB2CRequestLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AADB2CRequestLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AADB2CRequestLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AADCustomSecurityAttributeAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AADCustomSecurityAttributeAuditLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AADCustomSecurityAttributeAuditLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AADDomainServicesAccountLogon 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AADDomainServicesAccountLogon'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AADDomainServicesAccountLogon'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AADDomainServicesAccountManagement 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AADDomainServicesAccountManagement'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AADDomainServicesAccountManagement'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AADDomainServicesDirectoryServiceAccess 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AADDomainServicesDirectoryServiceAccess'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AADDomainServicesDirectoryServiceAccess'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AADDomainServicesDNSAuditsDynamicUpdates 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AADDomainServicesDNSAuditsDynamicUpdates'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AADDomainServicesDNSAuditsDynamicUpdates'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AADDomainServicesDNSAuditsGeneral 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AADDomainServicesDNSAuditsGeneral'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AADDomainServicesDNSAuditsGeneral'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AADDomainServicesLogonLogoff 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AADDomainServicesLogonLogoff'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AADDomainServicesLogonLogoff'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AADDomainServicesPolicyChange 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AADDomainServicesPolicyChange'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AADDomainServicesPolicyChange'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AADDomainServicesPrivilegeUse 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AADDomainServicesPrivilegeUse'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AADDomainServicesPrivilegeUse'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AADManagedIdentitySignInLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AADManagedIdentitySignInLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AADManagedIdentitySignInLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AADNonInteractiveUserSignInLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AADNonInteractiveUserSignInLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AADNonInteractiveUserSignInLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AADProvisioningLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AADProvisioningLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AADProvisioningLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AADRiskyServicePrincipals 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AADRiskyServicePrincipals'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AADRiskyServicePrincipals'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AADRiskyUsers 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AADRiskyUsers'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AADRiskyUsers'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AADServicePrincipalRiskEvents 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AADServicePrincipalRiskEvents'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AADServicePrincipalRiskEvents'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AADServicePrincipalSignInLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AADServicePrincipalSignInLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AADServicePrincipalSignInLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AADUserRiskEvents 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AADUserRiskEvents'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AADUserRiskEvents'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ABSBotRequests 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ABSBotRequests'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ABSBotRequests'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ACICollaborationAudit 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ACICollaborationAudit'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ACICollaborationAudit'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ACRConnectedClientList 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ACRConnectedClientList'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ACRConnectedClientList'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ACSAuthIncomingOperations 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ACSAuthIncomingOperations'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ACSAuthIncomingOperations'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ACSBillingUsage 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ACSBillingUsage'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ACSBillingUsage'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ACSCallAutomationIncomingOperations 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ACSCallAutomationIncomingOperations'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ACSCallAutomationIncomingOperations'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ACSCallAutomationMediaSummary 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ACSCallAutomationMediaSummary'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ACSCallAutomationMediaSummary'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ACSCallClientMediaStatsTimeSeries 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ACSCallClientMediaStatsTimeSeries'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ACSCallClientMediaStatsTimeSeries'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ACSCallClientOperations 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ACSCallClientOperations'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ACSCallClientOperations'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ACSCallClosedCaptionsSummary 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ACSCallClosedCaptionsSummary'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ACSCallClosedCaptionsSummary'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ACSCallDiagnostics 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ACSCallDiagnostics'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ACSCallDiagnostics'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ACSCallRecordingIncomingOperations 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ACSCallRecordingIncomingOperations'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ACSCallRecordingIncomingOperations'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ACSCallRecordingSummary 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ACSCallRecordingSummary'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ACSCallRecordingSummary'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ACSCallSummary 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ACSCallSummary'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ACSCallSummary'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ACSCallSurvey 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ACSCallSurvey'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ACSCallSurvey'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ACSChatIncomingOperations 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ACSChatIncomingOperations'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ACSChatIncomingOperations'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ACSEmailSendMailOperational 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ACSEmailSendMailOperational'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ACSEmailSendMailOperational'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ACSEmailStatusUpdateOperational 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ACSEmailStatusUpdateOperational'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ACSEmailStatusUpdateOperational'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ACSEmailUserEngagementOperational 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ACSEmailUserEngagementOperational'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ACSEmailUserEngagementOperational'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ACSJobRouterIncomingOperations 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ACSJobRouterIncomingOperations'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ACSJobRouterIncomingOperations'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ACSNetworkTraversalDiagnostics 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ACSNetworkTraversalDiagnostics'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ACSNetworkTraversalDiagnostics'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ACSNetworkTraversalIncomingOperations 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ACSNetworkTraversalIncomingOperations'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ACSNetworkTraversalIncomingOperations'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ACSRoomsIncomingOperations 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ACSRoomsIncomingOperations'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ACSRoomsIncomingOperations'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ACSSMSIncomingOperations 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ACSSMSIncomingOperations'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ACSSMSIncomingOperations'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ADAssessmentRecommendation 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ADAssessmentRecommendation'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADAssessmentRecommendation'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AddonAzureBackupAlerts 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AddonAzureBackupAlerts'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AddonAzureBackupAlerts'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AddonAzureBackupJobs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AddonAzureBackupJobs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AddonAzureBackupJobs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AddonAzureBackupPolicy 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AddonAzureBackupPolicy'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AddonAzureBackupPolicy'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AddonAzureBackupProtectedInstance 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AddonAzureBackupProtectedInstance'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AddonAzureBackupProtectedInstance'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AddonAzureBackupStorage 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AddonAzureBackupStorage'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AddonAzureBackupStorage'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ADFActivityRun 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ADFActivityRun'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADFActivityRun'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ADFAirflowSchedulerLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ADFAirflowSchedulerLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADFAirflowSchedulerLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ADFAirflowTaskLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ADFAirflowTaskLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADFAirflowTaskLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ADFAirflowWebLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ADFAirflowWebLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADFAirflowWebLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ADFAirflowWorkerLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ADFAirflowWorkerLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADFAirflowWorkerLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ADFPipelineRun 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ADFPipelineRun'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADFPipelineRun'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ADFSandboxActivityRun 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ADFSandboxActivityRun'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADFSandboxActivityRun'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ADFSandboxPipelineRun 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ADFSandboxPipelineRun'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADFSandboxPipelineRun'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ADFSSignInLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ADFSSignInLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADFSSignInLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ADFSSISIntegrationRuntimeLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ADFSSISIntegrationRuntimeLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADFSSISIntegrationRuntimeLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ADFSSISPackageEventMessageContext 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ADFSSISPackageEventMessageContext'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADFSSISPackageEventMessageContext'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ADFSSISPackageEventMessages 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ADFSSISPackageEventMessages'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADFSSISPackageEventMessages'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ADFSSISPackageExecutableStatistics 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ADFSSISPackageExecutableStatistics'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADFSSISPackageExecutableStatistics'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ADFSSISPackageExecutionComponentPhases 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ADFSSISPackageExecutionComponentPhases'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADFSSISPackageExecutionComponentPhases'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ADFSSISPackageExecutionDataStatistics 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ADFSSISPackageExecutionDataStatistics'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADFSSISPackageExecutionDataStatistics'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ADFTriggerRun 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ADFTriggerRun'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADFTriggerRun'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ADPAudit 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ADPAudit'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADPAudit'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ADPDiagnostics 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ADPDiagnostics'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADPDiagnostics'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ADPRequests 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ADPRequests'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADPRequests'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ADReplicationResult 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ADReplicationResult'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADReplicationResult'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ADSecurityAssessmentRecommendation 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ADSecurityAssessmentRecommendation'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADSecurityAssessmentRecommendation'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ADTDataHistoryOperation 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ADTDataHistoryOperation'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADTDataHistoryOperation'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ADTDigitalTwinsOperation 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ADTDigitalTwinsOperation'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADTDigitalTwinsOperation'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ADTEventRoutesOperation 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ADTEventRoutesOperation'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADTEventRoutesOperation'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ADTModelsOperation 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ADTModelsOperation'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADTModelsOperation'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ADTQueryOperation 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ADTQueryOperation'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADTQueryOperation'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ADXCommand 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ADXCommand'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADXCommand'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ADXIngestionBatching 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ADXIngestionBatching'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADXIngestionBatching'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ADXJournal 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ADXJournal'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADXJournal'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ADXQuery 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ADXQuery'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADXQuery'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ADXTableDetails 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ADXTableDetails'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADXTableDetails'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ADXTableUsageStatistics 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ADXTableUsageStatistics'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADXTableUsageStatistics'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AegDataPlaneRequests 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AegDataPlaneRequests'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AegDataPlaneRequests'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AegDeliveryFailureLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AegDeliveryFailureLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AegDeliveryFailureLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AegPublishFailureLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AegPublishFailureLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AegPublishFailureLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AEWAssignmentBlobLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AEWAssignmentBlobLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AEWAssignmentBlobLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AEWAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AEWAuditLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AEWAuditLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AEWComputePipelinesLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AEWComputePipelinesLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AEWComputePipelinesLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AFSAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AFSAuditLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AFSAuditLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AGCAccessLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AGCAccessLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AGCAccessLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AgriFoodApplicationAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AgriFoodApplicationAuditLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AgriFoodApplicationAuditLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AgriFoodFarmManagementLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AgriFoodFarmManagementLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AgriFoodFarmManagementLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AgriFoodFarmOperationLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AgriFoodFarmOperationLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AgriFoodFarmOperationLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AgriFoodInsightLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AgriFoodInsightLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AgriFoodInsightLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AgriFoodJobProcessedLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AgriFoodJobProcessedLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AgriFoodJobProcessedLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AgriFoodModelInferenceLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AgriFoodModelInferenceLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AgriFoodModelInferenceLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AgriFoodProviderAuthLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AgriFoodProviderAuthLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AgriFoodProviderAuthLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AgriFoodSatelliteLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AgriFoodSatelliteLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AgriFoodSatelliteLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AgriFoodSensorManagementLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AgriFoodSensorManagementLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AgriFoodSensorManagementLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AgriFoodWeatherLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AgriFoodWeatherLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AgriFoodWeatherLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AGSGrafanaLoginEvents 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AGSGrafanaLoginEvents'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AGSGrafanaLoginEvents'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AGWAccessLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AGWAccessLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AGWAccessLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AGWFirewallLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AGWFirewallLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AGWFirewallLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AGWPerformanceLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AGWPerformanceLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AGWPerformanceLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AHDSDicomAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AHDSDicomAuditLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AHDSDicomAuditLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AHDSDicomDiagnosticLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AHDSDicomDiagnosticLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AHDSDicomDiagnosticLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AHDSMedTechDiagnosticLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AHDSMedTechDiagnosticLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AHDSMedTechDiagnosticLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AirflowDagProcessingLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AirflowDagProcessingLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AirflowDagProcessingLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AKSAudit 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AKSAudit'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AKSAudit'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AKSAuditAdmin 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AKSAuditAdmin'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AKSAuditAdmin'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AKSControlPlane 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AKSControlPlane'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AKSControlPlane'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ALBHealthEvent 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ALBHealthEvent'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ALBHealthEvent'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_Alert 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'Alert'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'Alert'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AmlComputeClusterEvent 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AmlComputeClusterEvent'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AmlComputeClusterEvent'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AmlComputeClusterNodeEvent 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AmlComputeClusterNodeEvent'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AmlComputeClusterNodeEvent'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AmlComputeCpuGpuUtilization 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AmlComputeCpuGpuUtilization'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AmlComputeCpuGpuUtilization'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AmlComputeInstanceEvent 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AmlComputeInstanceEvent'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AmlComputeInstanceEvent'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AmlComputeJobEvent 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AmlComputeJobEvent'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AmlComputeJobEvent'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AmlDataLabelEvent 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AmlDataLabelEvent'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AmlDataLabelEvent'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AmlDataSetEvent 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AmlDataSetEvent'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AmlDataSetEvent'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AmlDataStoreEvent 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AmlDataStoreEvent'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AmlDataStoreEvent'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AmlDeploymentEvent 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AmlDeploymentEvent'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AmlDeploymentEvent'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AmlEnvironmentEvent 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AmlEnvironmentEvent'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AmlEnvironmentEvent'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AmlInferencingEvent 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AmlInferencingEvent'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AmlInferencingEvent'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AmlModelsEvent 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AmlModelsEvent'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AmlModelsEvent'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AmlOnlineEndpointConsoleLog 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AmlOnlineEndpointConsoleLog'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AmlOnlineEndpointConsoleLog'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AmlOnlineEndpointEventLog 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AmlOnlineEndpointEventLog'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AmlOnlineEndpointEventLog'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AmlOnlineEndpointTrafficLog 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AmlOnlineEndpointTrafficLog'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AmlOnlineEndpointTrafficLog'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AmlPipelineEvent 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AmlPipelineEvent'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AmlPipelineEvent'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AmlRegistryReadEventsLog 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AmlRegistryReadEventsLog'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AmlRegistryReadEventsLog'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AmlRegistryWriteEventsLog 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AmlRegistryWriteEventsLog'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AmlRegistryWriteEventsLog'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AmlRunEvent 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AmlRunEvent'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AmlRunEvent'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AmlRunStatusChangedEvent 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AmlRunStatusChangedEvent'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AmlRunStatusChangedEvent'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AMSKeyDeliveryRequests 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AMSKeyDeliveryRequests'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AMSKeyDeliveryRequests'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AMSLiveEventOperations 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AMSLiveEventOperations'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AMSLiveEventOperations'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AMSMediaAccountHealth 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AMSMediaAccountHealth'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AMSMediaAccountHealth'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AMSStreamingEndpointRequests 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AMSStreamingEndpointRequests'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AMSStreamingEndpointRequests'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AMWMetricsUsageDetails 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AMWMetricsUsageDetails'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AMWMetricsUsageDetails'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ANFFileAccess 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ANFFileAccess'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ANFFileAccess'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AOIDatabaseQuery 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AOIDatabaseQuery'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AOIDatabaseQuery'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AOIDigestion 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AOIDigestion'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AOIDigestion'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AOIStorage 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AOIStorage'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AOIStorage'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ApiManagementGatewayLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ApiManagementGatewayLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ApiManagementGatewayLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ApiManagementWebSocketConnectionLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ApiManagementWebSocketConnectionLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ApiManagementWebSocketConnectionLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AppAvailabilityResults 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AppAvailabilityResults'
  properties: {
    totalRetentionInDays: 90
    plan: 'Analytics'
    schema: {
      name: 'AppAvailabilityResults'
    }
    retentionInDays: 90
  }
}

resource ddos_target_1_AppBrowserTimings 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AppBrowserTimings'
  properties: {
    totalRetentionInDays: 90
    plan: 'Analytics'
    schema: {
      name: 'AppBrowserTimings'
    }
    retentionInDays: 90
  }
}

resource ddos_target_1_AppCenterError 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AppCenterError'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AppCenterError'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AppDependencies 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AppDependencies'
  properties: {
    totalRetentionInDays: 90
    plan: 'Analytics'
    schema: {
      name: 'AppDependencies'
    }
    retentionInDays: 90
  }
}

resource ddos_target_1_AppEnvSpringAppConsoleLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AppEnvSpringAppConsoleLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AppEnvSpringAppConsoleLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AppEvents 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AppEvents'
  properties: {
    totalRetentionInDays: 90
    plan: 'Analytics'
    schema: {
      name: 'AppEvents'
    }
    retentionInDays: 90
  }
}

resource ddos_target_1_AppExceptions 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AppExceptions'
  properties: {
    totalRetentionInDays: 90
    plan: 'Analytics'
    schema: {
      name: 'AppExceptions'
    }
    retentionInDays: 90
  }
}

resource ddos_target_1_AppMetrics 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AppMetrics'
  properties: {
    totalRetentionInDays: 90
    plan: 'Analytics'
    schema: {
      name: 'AppMetrics'
    }
    retentionInDays: 90
  }
}

resource ddos_target_1_AppPageViews 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AppPageViews'
  properties: {
    totalRetentionInDays: 90
    plan: 'Analytics'
    schema: {
      name: 'AppPageViews'
    }
    retentionInDays: 90
  }
}

resource ddos_target_1_AppPerformanceCounters 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AppPerformanceCounters'
  properties: {
    totalRetentionInDays: 90
    plan: 'Analytics'
    schema: {
      name: 'AppPerformanceCounters'
    }
    retentionInDays: 90
  }
}

resource ddos_target_1_AppPlatformBuildLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AppPlatformBuildLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AppPlatformBuildLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AppPlatformContainerEventLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AppPlatformContainerEventLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AppPlatformContainerEventLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AppPlatformIngressLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AppPlatformIngressLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AppPlatformIngressLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AppPlatformLogsforSpring 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AppPlatformLogsforSpring'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AppPlatformLogsforSpring'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AppPlatformSystemLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AppPlatformSystemLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AppPlatformSystemLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AppRequests 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AppRequests'
  properties: {
    totalRetentionInDays: 90
    plan: 'Analytics'
    schema: {
      name: 'AppRequests'
    }
    retentionInDays: 90
  }
}

resource ddos_target_1_AppServiceAntivirusScanAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AppServiceAntivirusScanAuditLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AppServiceAntivirusScanAuditLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AppServiceAppLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AppServiceAppLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AppServiceAppLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AppServiceAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AppServiceAuditLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AppServiceAuditLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AppServiceAuthenticationLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AppServiceAuthenticationLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AppServiceAuthenticationLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AppServiceConsoleLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AppServiceConsoleLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AppServiceConsoleLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AppServiceEnvironmentPlatformLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AppServiceEnvironmentPlatformLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AppServiceEnvironmentPlatformLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AppServiceFileAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AppServiceFileAuditLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AppServiceFileAuditLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AppServiceHTTPLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AppServiceHTTPLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AppServiceHTTPLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AppServiceIPSecAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AppServiceIPSecAuditLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AppServiceIPSecAuditLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AppServicePlatformLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AppServicePlatformLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AppServicePlatformLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AppServiceServerlessSecurityPluginData 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AppServiceServerlessSecurityPluginData'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AppServiceServerlessSecurityPluginData'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AppSystemEvents 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AppSystemEvents'
  properties: {
    totalRetentionInDays: 90
    plan: 'Analytics'
    schema: {
      name: 'AppSystemEvents'
    }
    retentionInDays: 90
  }
}

resource ddos_target_1_AppTraces 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AppTraces'
  properties: {
    totalRetentionInDays: 90
    plan: 'Analytics'
    schema: {
      name: 'AppTraces'
    }
    retentionInDays: 90
  }
}

resource ddos_target_1_ArcK8sAudit 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ArcK8sAudit'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ArcK8sAudit'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ArcK8sAuditAdmin 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ArcK8sAuditAdmin'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ArcK8sAuditAdmin'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ArcK8sControlPlane 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ArcK8sControlPlane'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ArcK8sControlPlane'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ASCAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ASCAuditLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ASCAuditLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ASCDeviceEvents 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ASCDeviceEvents'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ASCDeviceEvents'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ASRJobs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ASRJobs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ASRJobs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ASRReplicatedItems 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ASRReplicatedItems'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ASRReplicatedItems'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ATCExpressRouteCircuitIpfix 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ATCExpressRouteCircuitIpfix'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ATCExpressRouteCircuitIpfix'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AuditLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AuditLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AUIEventsAudit 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AUIEventsAudit'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AUIEventsAudit'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AUIEventsOperational 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AUIEventsOperational'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AUIEventsOperational'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AutoscaleEvaluationsLog 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AutoscaleEvaluationsLog'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AutoscaleEvaluationsLog'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AutoscaleScaleActionsLog 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AutoscaleScaleActionsLog'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AutoscaleScaleActionsLog'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AVNMConnectivityConfigurationChange 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AVNMConnectivityConfigurationChange'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AVNMConnectivityConfigurationChange'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AVNMIPAMPoolAllocationChange 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AVNMIPAMPoolAllocationChange'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AVNMIPAMPoolAllocationChange'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AVNMNetworkGroupMembershipChange 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AVNMNetworkGroupMembershipChange'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AVNMNetworkGroupMembershipChange'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AVNMRuleCollectionChange 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AVNMRuleCollectionChange'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AVNMRuleCollectionChange'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AVSSyslog 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AVSSyslog'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AVSSyslog'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AZFWApplicationRule 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AZFWApplicationRule'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AZFWApplicationRule'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AZFWApplicationRuleAggregation 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AZFWApplicationRuleAggregation'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AZFWApplicationRuleAggregation'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AZFWDnsQuery 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AZFWDnsQuery'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AZFWDnsQuery'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AZFWFatFlow 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AZFWFatFlow'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AZFWFatFlow'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AZFWFlowTrace 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AZFWFlowTrace'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AZFWFlowTrace'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AZFWIdpsSignature 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AZFWIdpsSignature'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AZFWIdpsSignature'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AZFWInternalFqdnResolutionFailure 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AZFWInternalFqdnResolutionFailure'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AZFWInternalFqdnResolutionFailure'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AZFWNatRule 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AZFWNatRule'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AZFWNatRule'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AZFWNatRuleAggregation 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AZFWNatRuleAggregation'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AZFWNatRuleAggregation'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AZFWNetworkRule 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AZFWNetworkRule'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AZFWNetworkRule'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AZFWNetworkRuleAggregation 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AZFWNetworkRuleAggregation'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AZFWNetworkRuleAggregation'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AZFWThreatIntel 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AZFWThreatIntel'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AZFWThreatIntel'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AZKVAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AZKVAuditLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AZKVAuditLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AZKVPolicyEvaluationDetailsLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AZKVPolicyEvaluationDetailsLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AZKVPolicyEvaluationDetailsLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AZMSApplicationMetricLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AZMSApplicationMetricLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AZMSApplicationMetricLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AZMSArchiveLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AZMSArchiveLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AZMSArchiveLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AZMSAutoscaleLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AZMSAutoscaleLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AZMSAutoscaleLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AZMSCustomerManagedKeyUserLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AZMSCustomerManagedKeyUserLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AZMSCustomerManagedKeyUserLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AZMSDiagnosticErrorLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AZMSDiagnosticErrorLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AZMSDiagnosticErrorLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AZMSHybridConnectionsEvents 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AZMSHybridConnectionsEvents'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AZMSHybridConnectionsEvents'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AZMSKafkaCoordinatorLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AZMSKafkaCoordinatorLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AZMSKafkaCoordinatorLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AZMSKafkaUserErrorLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AZMSKafkaUserErrorLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AZMSKafkaUserErrorLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AZMSOperationalLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AZMSOperationalLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AZMSOperationalLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AZMSRunTimeAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AZMSRunTimeAuditLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AZMSRunTimeAuditLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AZMSVnetConnectionEvents 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AZMSVnetConnectionEvents'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AZMSVnetConnectionEvents'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AzureActivity 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AzureActivity'
  properties: {
    totalRetentionInDays: 90
    plan: 'Analytics'
    schema: {
      name: 'AzureActivity'
    }
    retentionInDays: 90
  }
}

resource ddos_target_1_AzureActivityV2 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AzureActivityV2'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AzureActivityV2'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AzureAssessmentRecommendation 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AzureAssessmentRecommendation'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AzureAssessmentRecommendation'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AzureAttestationDiagnostics 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AzureAttestationDiagnostics'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AzureAttestationDiagnostics'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AzureBackupOperations 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AzureBackupOperations'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AzureBackupOperations'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AzureCloudHsmAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AzureCloudHsmAuditLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AzureCloudHsmAuditLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AzureDevOpsAuditing 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AzureDevOpsAuditing'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AzureDevOpsAuditing'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AzureDiagnostics 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AzureDiagnostics'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AzureDiagnostics'
      columns: [
        {
          name: 'ReportType_s'
          type: 'string'
          displayName: 'ReportType_s'
        }
        {
          name: 'MitigationPeriodStart_t'
          type: 'datetime'
          displayName: 'MitigationPeriodStart_t'
        }
        {
          name: 'MitigationPeriodEnd_t'
          type: 'datetime'
          displayName: 'MitigationPeriodEnd_t'
        }
        {
          name: 'IPAddress'
          type: 'string'
          displayName: 'IPAddress'
        }
        {
          name: 'AttackVectors_s'
          type: 'string'
          displayName: 'AttackVectors_s'
        }
        {
          name: 'TrafficOverview_s'
          type: 'string'
          displayName: 'TrafficOverview_s'
        }
        {
          name: 'Protocols_s'
          type: 'string'
          displayName: 'Protocols_s'
        }
        {
          name: 'DropReasons_s'
          type: 'string'
          displayName: 'DropReasons_s'
        }
        {
          name: 'TopSourceCountries_s'
          type: 'string'
          displayName: 'TopSourceCountries_s'
        }
        {
          name: 'TopSourceCountriesForDroppedPackets_s'
          type: 'string'
          displayName: 'TopSourceCountriesForDroppedPackets_s'
        }
        {
          name: 'TopSourceASNs_s'
          type: 'string'
          displayName: 'TopSourceASNs_s'
        }
        {
          name: 'SourceContinents_s'
          type: 'string'
          displayName: 'SourceContinents_s'
        }
        {
          name: 'sourcePublicIpAddress_s'
          type: 'string'
          displayName: 'sourcePublicIpAddress_s'
        }
        {
          name: 'sourcePort_s'
          type: 'string'
          displayName: 'sourcePort_s'
        }
        {
          name: 'destPublicIpAddress_s'
          type: 'string'
          displayName: 'destPublicIpAddress_s'
        }
        {
          name: 'destPort_s'
          type: 'string'
          displayName: 'destPort_s'
        }
        {
          name: 'protocol_s'
          type: 'string'
          displayName: 'protocol_s'
        }
        {
          name: 'Category'
          type: 'string'
          displayName: 'Category'
        }
        {
          name: 'ResourceId'
          type: 'string'
          displayName: 'ResourceId'
        }
        {
          name: 'OperationName'
          type: 'string'
          displayName: 'OperationName'
        }
        {
          name: 'publicIpAddress_s'
          type: 'string'
          displayName: 'publicIpAddress_s'
        }
        {
          name: 'type_s'
          type: 'string'
          displayName: 'type_s'
        }
        {
          name: 'Message'
          type: 'string'
          displayName: 'Message'
        }
        {
          name: 'SubscriptionId'
          type: 'guid'
          displayName: 'SubscriptionId'
        }
        {
          name: 'ResourceGroup'
          type: 'string'
          displayName: 'ResourceGroup'
        }
        {
          name: 'ResourceProvider'
          type: 'string'
          displayName: 'ResourceProvider'
        }
        {
          name: 'Resource'
          type: 'string'
          displayName: 'Resource'
        }
        {
          name: 'ResourceType'
          type: 'string'
          displayName: 'ResourceType'
        }
        {
          name: '_CustomFieldsCollection'
          type: 'dynamic'
          displayName: 'AdditionalFields'
        }
      ]
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AzureLoadTestingOperation 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AzureLoadTestingOperation'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AzureLoadTestingOperation'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AzureMetrics 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AzureMetrics'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AzureMetrics'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_AzureMetricsV2 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'AzureMetricsV2'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AzureMetricsV2'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_BlockchainApplicationLog 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'BlockchainApplicationLog'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'BlockchainApplicationLog'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_BlockchainProxyLog 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'BlockchainProxyLog'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'BlockchainProxyLog'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_CassandraAudit 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'CassandraAudit'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'CassandraAudit'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_CassandraLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'CassandraLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'CassandraLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_CCFApplicationLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'CCFApplicationLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'CCFApplicationLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_CDBCassandraRequests 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'CDBCassandraRequests'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'CDBCassandraRequests'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_CDBControlPlaneRequests 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'CDBControlPlaneRequests'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'CDBControlPlaneRequests'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_CDBDataPlaneRequests 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'CDBDataPlaneRequests'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'CDBDataPlaneRequests'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_CDBGremlinRequests 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'CDBGremlinRequests'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'CDBGremlinRequests'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_CDBMongoRequests 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'CDBMongoRequests'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'CDBMongoRequests'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_CDBPartitionKeyRUConsumption 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'CDBPartitionKeyRUConsumption'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'CDBPartitionKeyRUConsumption'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_CDBPartitionKeyStatistics 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'CDBPartitionKeyStatistics'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'CDBPartitionKeyStatistics'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_CDBQueryRuntimeStatistics 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'CDBQueryRuntimeStatistics'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'CDBQueryRuntimeStatistics'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ChaosStudioExperimentEventLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ChaosStudioExperimentEventLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ChaosStudioExperimentEventLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_CHSMManagementAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'CHSMManagementAuditLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'CHSMManagementAuditLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_CIEventsAudit 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'CIEventsAudit'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'CIEventsAudit'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_CIEventsOperational 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'CIEventsOperational'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'CIEventsOperational'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ComputerGroup 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ComputerGroup'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ComputerGroup'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ContainerAppConsoleLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ContainerAppConsoleLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ContainerAppConsoleLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ContainerAppSystemLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ContainerAppSystemLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ContainerAppSystemLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ContainerEvent 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ContainerEvent'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ContainerEvent'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ContainerImageInventory 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ContainerImageInventory'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ContainerImageInventory'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ContainerInstanceLog 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ContainerInstanceLog'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ContainerInstanceLog'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ContainerInventory 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ContainerInventory'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ContainerInventory'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ContainerLog 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ContainerLog'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ContainerLog'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ContainerLogV2 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ContainerLogV2'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ContainerLogV2'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ContainerNodeInventory 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ContainerNodeInventory'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ContainerNodeInventory'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ContainerRegistryLoginEvents 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ContainerRegistryLoginEvents'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ContainerRegistryLoginEvents'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ContainerRegistryRepositoryEvents 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ContainerRegistryRepositoryEvents'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ContainerRegistryRepositoryEvents'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ContainerServiceLog 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ContainerServiceLog'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ContainerServiceLog'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_CoreAzureBackup 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'CoreAzureBackup'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'CoreAzureBackup'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_DatabricksAccounts 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'DatabricksAccounts'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksAccounts'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_DatabricksBrickStoreHttpGateway 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'DatabricksBrickStoreHttpGateway'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksBrickStoreHttpGateway'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_DatabricksCapsule8Dataplane 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'DatabricksCapsule8Dataplane'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksCapsule8Dataplane'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_DatabricksClamAVScan 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'DatabricksClamAVScan'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksClamAVScan'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_DatabricksCloudStorageMetadata 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'DatabricksCloudStorageMetadata'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksCloudStorageMetadata'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_DatabricksClusterLibraries 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'DatabricksClusterLibraries'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksClusterLibraries'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_DatabricksClusters 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'DatabricksClusters'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksClusters'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_DatabricksDashboards 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'DatabricksDashboards'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksDashboards'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_DatabricksDatabricksSQL 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'DatabricksDatabricksSQL'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksDatabricksSQL'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_DatabricksDataMonitoring 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'DatabricksDataMonitoring'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksDataMonitoring'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_DatabricksDBFS 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'DatabricksDBFS'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksDBFS'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_DatabricksDeltaPipelines 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'DatabricksDeltaPipelines'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksDeltaPipelines'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_DatabricksFeatureStore 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'DatabricksFeatureStore'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksFeatureStore'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_DatabricksFilesystem 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'DatabricksFilesystem'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksFilesystem'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_DatabricksGenie 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'DatabricksGenie'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksGenie'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_DatabricksGitCredentials 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'DatabricksGitCredentials'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksGitCredentials'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_DatabricksGlobalInitScripts 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'DatabricksGlobalInitScripts'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksGlobalInitScripts'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_DatabricksIAMRole 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'DatabricksIAMRole'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksIAMRole'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_DatabricksIngestion 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'DatabricksIngestion'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksIngestion'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_DatabricksInstancePools 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'DatabricksInstancePools'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksInstancePools'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_DatabricksJobs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'DatabricksJobs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksJobs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_DatabricksLineageTracking 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'DatabricksLineageTracking'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksLineageTracking'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_DatabricksMarketplaceConsumer 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'DatabricksMarketplaceConsumer'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksMarketplaceConsumer'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_DatabricksMLflowAcledArtifact 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'DatabricksMLflowAcledArtifact'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksMLflowAcledArtifact'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_DatabricksMLflowExperiment 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'DatabricksMLflowExperiment'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksMLflowExperiment'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_DatabricksModelRegistry 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'DatabricksModelRegistry'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksModelRegistry'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_DatabricksNotebook 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'DatabricksNotebook'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksNotebook'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_DatabricksPartnerHub 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'DatabricksPartnerHub'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksPartnerHub'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_DatabricksPredictiveOptimization 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'DatabricksPredictiveOptimization'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksPredictiveOptimization'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_DatabricksRemoteHistoryService 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'DatabricksRemoteHistoryService'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksRemoteHistoryService'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_DatabricksRepos 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'DatabricksRepos'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksRepos'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_DatabricksSecrets 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'DatabricksSecrets'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksSecrets'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_DatabricksServerlessRealTimeInference 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'DatabricksServerlessRealTimeInference'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksServerlessRealTimeInference'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_DatabricksSQL 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'DatabricksSQL'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksSQL'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_DatabricksSQLPermissions 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'DatabricksSQLPermissions'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksSQLPermissions'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_DatabricksSSH 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'DatabricksSSH'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksSSH'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_DatabricksUnityCatalog 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'DatabricksUnityCatalog'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksUnityCatalog'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_DatabricksWebTerminal 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'DatabricksWebTerminal'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksWebTerminal'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_DatabricksWorkspace 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'DatabricksWorkspace'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksWorkspace'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_DataTransferOperations 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'DataTransferOperations'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DataTransferOperations'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_DCRLogErrors 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'DCRLogErrors'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DCRLogErrors'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_DCRLogTroubleshooting 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'DCRLogTroubleshooting'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DCRLogTroubleshooting'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_DevCenterBillingEventLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'DevCenterBillingEventLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DevCenterBillingEventLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_DevCenterDiagnosticLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'DevCenterDiagnosticLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DevCenterDiagnosticLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_DevCenterResourceOperationLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'DevCenterResourceOperationLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DevCenterResourceOperationLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_DNSQueryLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'DNSQueryLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DNSQueryLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_DSMAzureBlobStorageLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'DSMAzureBlobStorageLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DSMAzureBlobStorageLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_DSMDataClassificationLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'DSMDataClassificationLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DSMDataClassificationLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_DSMDataLabelingLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'DSMDataLabelingLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DSMDataLabelingLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_EGNFailedMqttConnections 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'EGNFailedMqttConnections'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'EGNFailedMqttConnections'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_EGNFailedMqttPublishedMessages 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'EGNFailedMqttPublishedMessages'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'EGNFailedMqttPublishedMessages'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_EGNFailedMqttSubscriptions 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'EGNFailedMqttSubscriptions'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'EGNFailedMqttSubscriptions'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_EGNMqttDisconnections 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'EGNMqttDisconnections'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'EGNMqttDisconnections'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_EGNSuccessfulMqttConnections 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'EGNSuccessfulMqttConnections'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'EGNSuccessfulMqttConnections'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_EnrichedMicrosoft365AuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'EnrichedMicrosoft365AuditLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'EnrichedMicrosoft365AuditLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ETWEvent 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ETWEvent'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ETWEvent'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_Event 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'Event'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'Event'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ExchangeAssessmentRecommendation 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ExchangeAssessmentRecommendation'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ExchangeAssessmentRecommendation'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ExchangeOnlineAssessmentRecommendation 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ExchangeOnlineAssessmentRecommendation'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ExchangeOnlineAssessmentRecommendation'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_FailedIngestion 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'FailedIngestion'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'FailedIngestion'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_FunctionAppLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'FunctionAppLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'FunctionAppLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_HDInsightAmbariClusterAlerts 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'HDInsightAmbariClusterAlerts'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightAmbariClusterAlerts'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_HDInsightAmbariSystemMetrics 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'HDInsightAmbariSystemMetrics'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightAmbariSystemMetrics'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_HDInsightGatewayAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'HDInsightGatewayAuditLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightGatewayAuditLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_HDInsightHadoopAndYarnLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'HDInsightHadoopAndYarnLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightHadoopAndYarnLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_HDInsightHadoopAndYarnMetrics 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'HDInsightHadoopAndYarnMetrics'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightHadoopAndYarnMetrics'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_HDInsightHBaseLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'HDInsightHBaseLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightHBaseLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_HDInsightHBaseMetrics 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'HDInsightHBaseMetrics'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightHBaseMetrics'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_HDInsightHiveAndLLAPLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'HDInsightHiveAndLLAPLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightHiveAndLLAPLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_HDInsightHiveAndLLAPMetrics 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'HDInsightHiveAndLLAPMetrics'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightHiveAndLLAPMetrics'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_HDInsightHiveQueryAppStats 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'HDInsightHiveQueryAppStats'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightHiveQueryAppStats'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_HDInsightHiveTezAppStats 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'HDInsightHiveTezAppStats'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightHiveTezAppStats'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_HDInsightJupyterNotebookEvents 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'HDInsightJupyterNotebookEvents'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightJupyterNotebookEvents'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_HDInsightKafkaLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'HDInsightKafkaLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightKafkaLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_HDInsightKafkaMetrics 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'HDInsightKafkaMetrics'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightKafkaMetrics'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_HDInsightKafkaServerLog 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'HDInsightKafkaServerLog'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightKafkaServerLog'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_HDInsightOozieLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'HDInsightOozieLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightOozieLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_HDInsightRangerAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'HDInsightRangerAuditLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightRangerAuditLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_HDInsightSecurityLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'HDInsightSecurityLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightSecurityLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_HDInsightSparkApplicationEvents 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'HDInsightSparkApplicationEvents'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightSparkApplicationEvents'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_HDInsightSparkBlockManagerEvents 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'HDInsightSparkBlockManagerEvents'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightSparkBlockManagerEvents'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_HDInsightSparkEnvironmentEvents 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'HDInsightSparkEnvironmentEvents'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightSparkEnvironmentEvents'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_HDInsightSparkExecutorEvents 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'HDInsightSparkExecutorEvents'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightSparkExecutorEvents'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_HDInsightSparkExtraEvents 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'HDInsightSparkExtraEvents'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightSparkExtraEvents'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_HDInsightSparkJobEvents 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'HDInsightSparkJobEvents'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightSparkJobEvents'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_HDInsightSparkLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'HDInsightSparkLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightSparkLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_HDInsightSparkSQLExecutionEvents 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'HDInsightSparkSQLExecutionEvents'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightSparkSQLExecutionEvents'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_HDInsightSparkStageEvents 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'HDInsightSparkStageEvents'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightSparkStageEvents'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_HDInsightSparkStageTaskAccumulables 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'HDInsightSparkStageTaskAccumulables'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightSparkStageTaskAccumulables'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_HDInsightSparkTaskEvents 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'HDInsightSparkTaskEvents'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightSparkTaskEvents'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_HDInsightStormLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'HDInsightStormLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightStormLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_HDInsightStormMetrics 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'HDInsightStormMetrics'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightStormMetrics'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_HDInsightStormTopologyMetrics 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'HDInsightStormTopologyMetrics'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightStormTopologyMetrics'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_HealthStateChangeEvent 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'HealthStateChangeEvent'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HealthStateChangeEvent'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_Heartbeat 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'Heartbeat'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'Heartbeat'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_InsightsMetrics 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'InsightsMetrics'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'InsightsMetrics'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_IntuneAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'IntuneAuditLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'IntuneAuditLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_IntuneDeviceComplianceOrg 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'IntuneDeviceComplianceOrg'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'IntuneDeviceComplianceOrg'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_IntuneDevices 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'IntuneDevices'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'IntuneDevices'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_IntuneOperationalLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'IntuneOperationalLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'IntuneOperationalLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_KubeEvents 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'KubeEvents'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'KubeEvents'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_KubeHealth 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'KubeHealth'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'KubeHealth'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_KubeMonAgentEvents 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'KubeMonAgentEvents'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'KubeMonAgentEvents'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_KubeNodeInventory 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'KubeNodeInventory'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'KubeNodeInventory'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_KubePodInventory 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'KubePodInventory'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'KubePodInventory'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_KubePVInventory 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'KubePVInventory'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'KubePVInventory'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_KubeServices 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'KubeServices'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'KubeServices'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_LAQueryLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'LAQueryLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'LAQueryLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_LASummaryLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'LASummaryLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'LASummaryLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_LogicAppWorkflowRuntime 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'LogicAppWorkflowRuntime'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'LogicAppWorkflowRuntime'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_MCCEventLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'MCCEventLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'MCCEventLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_MCVPAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'MCVPAuditLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'MCVPAuditLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_MCVPOperationLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'MCVPOperationLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'MCVPOperationLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_MDCFileIntegrityMonitoringEvents 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'MDCFileIntegrityMonitoringEvents'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'MDCFileIntegrityMonitoringEvents'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_MDECustomCollectionDeviceFileEvents 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'MDECustomCollectionDeviceFileEvents'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'MDECustomCollectionDeviceFileEvents'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_MicrosoftAzureBastionAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'MicrosoftAzureBastionAuditLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'MicrosoftAzureBastionAuditLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_MicrosoftDataShareReceivedSnapshotLog 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'MicrosoftDataShareReceivedSnapshotLog'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'MicrosoftDataShareReceivedSnapshotLog'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_MicrosoftDataShareSentSnapshotLog 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'MicrosoftDataShareSentSnapshotLog'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'MicrosoftDataShareSentSnapshotLog'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_MicrosoftDataShareShareLog 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'MicrosoftDataShareShareLog'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'MicrosoftDataShareShareLog'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_MicrosoftGraphActivityLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'MicrosoftGraphActivityLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'MicrosoftGraphActivityLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_MicrosoftHealthcareApisAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'MicrosoftHealthcareApisAuditLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'MicrosoftHealthcareApisAuditLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_MNFDeviceUpdates 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'MNFDeviceUpdates'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'MNFDeviceUpdates'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_MNFSystemSessionHistoryUpdates 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'MNFSystemSessionHistoryUpdates'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'MNFSystemSessionHistoryUpdates'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_MNFSystemStateMessageUpdates 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'MNFSystemStateMessageUpdates'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'MNFSystemStateMessageUpdates'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_NCBMBreakGlassAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'NCBMBreakGlassAuditLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'NCBMBreakGlassAuditLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_NCBMSecurityDefenderLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'NCBMSecurityDefenderLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'NCBMSecurityDefenderLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_NCBMSecurityLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'NCBMSecurityLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'NCBMSecurityLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_NCBMSystemLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'NCBMSystemLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'NCBMSystemLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_NCCKubernetesLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'NCCKubernetesLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'NCCKubernetesLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_NCCVMOrchestrationLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'NCCVMOrchestrationLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'NCCVMOrchestrationLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_NCSStorageAlerts 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'NCSStorageAlerts'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'NCSStorageAlerts'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_NCSStorageLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'NCSStorageLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'NCSStorageLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_NetworkAccessTraffic 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'NetworkAccessTraffic'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'NetworkAccessTraffic'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_NGXOperationLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'NGXOperationLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'NGXOperationLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_NSPAccessLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'NSPAccessLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'NSPAccessLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_NTAInsights 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'NTAInsights'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'NTAInsights'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_NTAIpDetails 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'NTAIpDetails'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'NTAIpDetails'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_NTANetAnalytics 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'NTANetAnalytics'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'NTANetAnalytics'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_NTATopologyDetails 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'NTATopologyDetails'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'NTATopologyDetails'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_NWConnectionMonitorDNSResult 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'NWConnectionMonitorDNSResult'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'NWConnectionMonitorDNSResult'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_NWConnectionMonitorPathResult 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'NWConnectionMonitorPathResult'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'NWConnectionMonitorPathResult'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_NWConnectionMonitorTestResult 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'NWConnectionMonitorTestResult'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'NWConnectionMonitorTestResult'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_OEPAirFlowTask 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'OEPAirFlowTask'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'OEPAirFlowTask'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_OEPAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'OEPAuditLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'OEPAuditLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_OEPDataplaneLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'OEPDataplaneLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'OEPDataplaneLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_OEPElasticOperator 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'OEPElasticOperator'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'OEPElasticOperator'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_OEPElasticsearch 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'OEPElasticsearch'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'OEPElasticsearch'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_OLPSupplyChainEntityOperations 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'OLPSupplyChainEntityOperations'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'OLPSupplyChainEntityOperations'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_OLPSupplyChainEvents 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'OLPSupplyChainEvents'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'OLPSupplyChainEvents'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_Operation 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'Operation'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'Operation'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_Perf 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'Perf'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'Perf'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_PFTitleAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'PFTitleAuditLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'PFTitleAuditLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_PowerBIAuditTenant 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'PowerBIAuditTenant'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'PowerBIAuditTenant'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_PowerBIDatasetsTenant 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'PowerBIDatasetsTenant'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'PowerBIDatasetsTenant'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_PowerBIDatasetsWorkspace 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'PowerBIDatasetsWorkspace'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'PowerBIDatasetsWorkspace'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_PowerBIReportUsageTenant 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'PowerBIReportUsageTenant'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'PowerBIReportUsageTenant'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_PowerBIReportUsageWorkspace 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'PowerBIReportUsageWorkspace'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'PowerBIReportUsageWorkspace'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_PurviewDataSensitivityLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'PurviewDataSensitivityLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'PurviewDataSensitivityLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_PurviewScanStatusLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'PurviewScanStatusLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'PurviewScanStatusLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_PurviewSecurityLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'PurviewSecurityLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'PurviewSecurityLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_REDConnectionEvents 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'REDConnectionEvents'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'REDConnectionEvents'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_RemoteNetworkHealthLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'RemoteNetworkHealthLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'RemoteNetworkHealthLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ResourceManagementPublicAccessLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ResourceManagementPublicAccessLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ResourceManagementPublicAccessLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_SCCMAssessmentRecommendation 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'SCCMAssessmentRecommendation'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SCCMAssessmentRecommendation'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_SCOMAssessmentRecommendation 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'SCOMAssessmentRecommendation'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SCOMAssessmentRecommendation'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ServiceFabricOperationalEvent 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ServiceFabricOperationalEvent'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ServiceFabricOperationalEvent'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ServiceFabricReliableActorEvent 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ServiceFabricReliableActorEvent'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ServiceFabricReliableActorEvent'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_ServiceFabricReliableServiceEvent 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'ServiceFabricReliableServiceEvent'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ServiceFabricReliableServiceEvent'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_SfBAssessmentRecommendation 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'SfBAssessmentRecommendation'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SfBAssessmentRecommendation'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_SfBOnlineAssessmentRecommendation 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'SfBOnlineAssessmentRecommendation'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SfBOnlineAssessmentRecommendation'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_SharePointOnlineAssessmentRecommendation 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'SharePointOnlineAssessmentRecommendation'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SharePointOnlineAssessmentRecommendation'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_SignalRServiceDiagnosticLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'SignalRServiceDiagnosticLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SignalRServiceDiagnosticLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_SigninLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'SigninLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SigninLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_SPAssessmentRecommendation 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'SPAssessmentRecommendation'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SPAssessmentRecommendation'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_SQLAssessmentRecommendation 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'SQLAssessmentRecommendation'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SQLAssessmentRecommendation'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_SQLSecurityAuditEvents 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'SQLSecurityAuditEvents'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SQLSecurityAuditEvents'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_StorageAntimalwareScanResults 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'StorageAntimalwareScanResults'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'StorageAntimalwareScanResults'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_StorageBlobLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'StorageBlobLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'StorageBlobLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_StorageCacheOperationEvents 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'StorageCacheOperationEvents'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'StorageCacheOperationEvents'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_StorageCacheUpgradeEvents 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'StorageCacheUpgradeEvents'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'StorageCacheUpgradeEvents'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_StorageCacheWarningEvents 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'StorageCacheWarningEvents'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'StorageCacheWarningEvents'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_StorageFileLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'StorageFileLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'StorageFileLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_StorageMalwareScanningResults 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'StorageMalwareScanningResults'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'StorageMalwareScanningResults'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_StorageMoverCopyLogsFailed 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'StorageMoverCopyLogsFailed'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'StorageMoverCopyLogsFailed'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_StorageMoverCopyLogsTransferred 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'StorageMoverCopyLogsTransferred'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'StorageMoverCopyLogsTransferred'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_StorageMoverJobRunLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'StorageMoverJobRunLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'StorageMoverJobRunLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_StorageQueueLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'StorageQueueLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'StorageQueueLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_StorageTableLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'StorageTableLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'StorageTableLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_SucceededIngestion 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'SucceededIngestion'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SucceededIngestion'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_SynapseBigDataPoolApplicationsEnded 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'SynapseBigDataPoolApplicationsEnded'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SynapseBigDataPoolApplicationsEnded'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_SynapseBuiltinSqlPoolRequestsEnded 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'SynapseBuiltinSqlPoolRequestsEnded'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SynapseBuiltinSqlPoolRequestsEnded'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_SynapseDXCommand 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'SynapseDXCommand'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SynapseDXCommand'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_SynapseDXFailedIngestion 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'SynapseDXFailedIngestion'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SynapseDXFailedIngestion'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_SynapseDXIngestionBatching 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'SynapseDXIngestionBatching'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SynapseDXIngestionBatching'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_SynapseDXQuery 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'SynapseDXQuery'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SynapseDXQuery'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_SynapseDXSucceededIngestion 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'SynapseDXSucceededIngestion'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SynapseDXSucceededIngestion'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_SynapseDXTableDetails 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'SynapseDXTableDetails'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SynapseDXTableDetails'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_SynapseDXTableUsageStatistics 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'SynapseDXTableUsageStatistics'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SynapseDXTableUsageStatistics'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_SynapseGatewayApiRequests 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'SynapseGatewayApiRequests'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SynapseGatewayApiRequests'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_SynapseIntegrationActivityRuns 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'SynapseIntegrationActivityRuns'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SynapseIntegrationActivityRuns'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_SynapseIntegrationPipelineRuns 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'SynapseIntegrationPipelineRuns'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SynapseIntegrationPipelineRuns'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_SynapseIntegrationTriggerRuns 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'SynapseIntegrationTriggerRuns'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SynapseIntegrationTriggerRuns'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_SynapseLinkEvent 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'SynapseLinkEvent'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SynapseLinkEvent'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_SynapseRbacOperations 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'SynapseRbacOperations'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SynapseRbacOperations'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_SynapseScopePoolScopeJobsEnded 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'SynapseScopePoolScopeJobsEnded'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SynapseScopePoolScopeJobsEnded'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_SynapseScopePoolScopeJobsStateChange 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'SynapseScopePoolScopeJobsStateChange'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SynapseScopePoolScopeJobsStateChange'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_SynapseSqlPoolDmsWorkers 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'SynapseSqlPoolDmsWorkers'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SynapseSqlPoolDmsWorkers'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_SynapseSqlPoolExecRequests 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'SynapseSqlPoolExecRequests'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SynapseSqlPoolExecRequests'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_SynapseSqlPoolRequestSteps 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'SynapseSqlPoolRequestSteps'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SynapseSqlPoolRequestSteps'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_SynapseSqlPoolSqlRequests 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'SynapseSqlPoolSqlRequests'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SynapseSqlPoolSqlRequests'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_SynapseSqlPoolWaits 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'SynapseSqlPoolWaits'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SynapseSqlPoolWaits'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_Syslog 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'Syslog'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'Syslog'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_TSIIngress 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'TSIIngress'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'TSIIngress'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_UCClient 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'UCClient'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'UCClient'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_UCClientReadinessStatus 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'UCClientReadinessStatus'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'UCClientReadinessStatus'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_UCClientUpdateStatus 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'UCClientUpdateStatus'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'UCClientUpdateStatus'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_UCDeviceAlert 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'UCDeviceAlert'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'UCDeviceAlert'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_UCDOAggregatedStatus 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'UCDOAggregatedStatus'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'UCDOAggregatedStatus'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_UCDOStatus 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'UCDOStatus'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'UCDOStatus'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_UCServiceUpdateStatus 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'UCServiceUpdateStatus'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'UCServiceUpdateStatus'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_UCUpdateAlert 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'UCUpdateAlert'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'UCUpdateAlert'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_Usage 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'Usage'
  properties: {
    totalRetentionInDays: 90
    plan: 'Analytics'
    schema: {
      name: 'Usage'
    }
    retentionInDays: 90
  }
}

resource ddos_target_1_VCoreMongoRequests 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'VCoreMongoRequests'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'VCoreMongoRequests'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_VIAudit 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'VIAudit'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'VIAudit'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_VIIndexing 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'VIIndexing'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'VIIndexing'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_VMBoundPort 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'VMBoundPort'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'VMBoundPort'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_VMComputer 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'VMComputer'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'VMComputer'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_VMConnection 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'VMConnection'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'VMConnection'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_VMProcess 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'VMProcess'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'VMProcess'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_W3CIISLog 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'W3CIISLog'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'W3CIISLog'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_WebPubSubConnectivity 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'WebPubSubConnectivity'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'WebPubSubConnectivity'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_WebPubSubHttpRequest 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'WebPubSubHttpRequest'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'WebPubSubHttpRequest'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_WebPubSubMessaging 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'WebPubSubMessaging'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'WebPubSubMessaging'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_Windows365AuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'Windows365AuditLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'Windows365AuditLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_WindowsClientAssessmentRecommendation 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'WindowsClientAssessmentRecommendation'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'WindowsClientAssessmentRecommendation'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_WindowsServerAssessmentRecommendation 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'WindowsServerAssessmentRecommendation'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'WindowsServerAssessmentRecommendation'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_WorkloadDiagnosticLogs 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'WorkloadDiagnosticLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'WorkloadDiagnosticLogs'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_WVDAgentHealthStatus 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'WVDAgentHealthStatus'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'WVDAgentHealthStatus'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_WVDAutoscaleEvaluationPooled 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'WVDAutoscaleEvaluationPooled'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'WVDAutoscaleEvaluationPooled'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_WVDCheckpoints 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'WVDCheckpoints'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'WVDCheckpoints'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_WVDConnectionGraphicsDataPreview 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'WVDConnectionGraphicsDataPreview'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'WVDConnectionGraphicsDataPreview'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_WVDConnectionNetworkData 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'WVDConnectionNetworkData'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'WVDConnectionNetworkData'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_WVDConnections 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'WVDConnections'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'WVDConnections'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_WVDErrors 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'WVDErrors'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'WVDErrors'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_WVDFeeds 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'WVDFeeds'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'WVDFeeds'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_WVDHostRegistrations 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'WVDHostRegistrations'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'WVDHostRegistrations'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_WVDManagement 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'WVDManagement'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'WVDManagement'
    }
    retentionInDays: 30
  }
}

resource ddos_target_1_WVDSessionHostManagement 'Microsoft.OperationalInsights/workspaces/tables@2022-10-01' = {
  parent: ddos_target_1
  name: 'WVDSessionHostManagement'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'WVDSessionHostManagement'
    }
    retentionInDays: 30
  }
}

resource Ddos_Attack 'microsoft.insights/metricAlerts@2018-03-01' = {
  name: 'Ddos Attack'
  location: 'global'
  properties: {
    description: 'Web portal is under attack. '
    severity: 0
    enabled: true
    scopes: [
      target_1_ip.id
    ]
    evaluationFrequency: 'PT1M'
    windowSize: 'PT5M'
    criteria: {
      allOf: [
        {
          threshold: 0
          name: 'Metric1'
          metricNamespace: 'Microsoft.Network/publicIPAddresses'
          metricName: 'IfUnderDDoSAttack'
          operator: 'GreaterThan'
          timeAggregation: 'Maximum'
          skipMetricValidation: false
          criterionType: 'StaticThresholdCriterion'
        }
      ]
      'odata.type': 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
    }
    autoMitigate: true
    targetResourceType: 'Microsoft.Network/publicIPAddresses'
    targetResourceRegion: 'swedencentral'
    actions: [
      {
        actionGroupId: ag_ddos_alert_1.id
        webHookProperties: {}
      }
    ]
  }
}

resource target_1_vnet 'Microsoft.Network/virtualNetworks@2023-11-01' = {
  name: 'target-1-vnet'
  location: 'swedencentral'
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    dhcpOptions: {
      dnsServers: []
    }
    subnets: [
      {
        name: 'default'
        id: target_1_vnet_default.id
        properties: {
          addressPrefix: '10.0.0.0/24'
          networkSecurityGroup: {
            id: target_1_vnet_default_nsg_swedencentral.id
          }
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
    ]
    virtualNetworkPeerings: []
    enableDdosProtection: true
    ddosProtectionPlan: {
      id: ddos_plan_1.id
    }
  }
}

resource ddos_outbound_1_default 'Microsoft.Network/virtualNetworks/subnets@2023-11-01' = {
  name: 'ddos-outbound-1/default'
  properties: {
    addressPrefix: '10.1.0.0/21'
    networkSecurityGroup: {
      id: ddos_outbound_1_default_nsg_swedencentral.id
    }
    delegations: []
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
  dependsOn: [
    ddos_outbound_1

  ]
}

resource target_1_vnet_default 'Microsoft.Network/virtualNetworks/subnets@2023-11-01' = {
  name: 'target-1-vnet/default'
  properties: {
    addressPrefix: '10.0.0.0/24'
    networkSecurityGroup: {
      id: target_1_vnet_default_nsg_swedencentral.id
    }
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
  dependsOn: [
    target_1_vnet

  ]
}

resource target_1112_z1 'Microsoft.Network/networkInterfaces@2023-11-01' = {
  name: 'target-1112_z1'
  location: 'swedencentral'
  kind: 'Regular'
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        id: '${target_1112_z1.id}/ipConfigurations/ipconfig1'
        type: 'Microsoft.Network/networkInterfaces/ipConfigurations'
        properties: {
          privateIPAddress: '10.0.0.4'
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: target_1_ip.id
            properties: {
              deleteOption: 'Detach'
            }
          }
          subnet: {
            id: target_1_vnet_default.id
          }
          primary: true
          privateIPAddressVersion: 'IPv4'
        }
      }
    ]
    dnsSettings: {
      dnsServers: []
    }
    enableAcceleratedNetworking: false
    enableIPForwarding: false
    disableTcpStateTracking: false
    networkSecurityGroup: {
      id: target_1_nsg.id
    }
    nicType: 'Standard'
    auxiliaryMode: 'None'
    auxiliarySku: 'None'
  }
}