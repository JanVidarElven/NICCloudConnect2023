# Install 
Install-Module Microsoft.Graph.Compatibility.AzureAD -AllowPrerelease

# Import
Import-Module Microsoft.Graph.Compatibility.AzureAD -Force

# Connect to Graph
Connect-MgGraph

# Run commands with *CompatAD*
Get-CompatADUser -SearchString "Wild River"

# Run commands with -Debug to see the Graph calls
Get-CompatADUser -SearchString "Wild River" -Debug

# Enable aliases
Set-CompatADAlias

Get-Alias -Name *AzureAD*

Get-AzureADUser -SearchString "Wild River"



